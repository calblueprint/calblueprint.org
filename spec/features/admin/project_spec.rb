require "rails_helper"

RSpec.describe 'The admin projects page' do
  let(:published_css_class) { '.projects--published' }
  let(:unpublished_css_class) { '.projects--unpublished' }

  # Projects tables should contain the right projects
  def verify_projects_tables # rubocop:disable Metrics/AbcSize
    within published_css_class do
      Project.published.each do |project|
        expect(page).to have_css "##{dom_id project}"
      end
    end

    within unpublished_css_class do
      Project.unpublished.each do |project|
        expect(page).to have_css "##{dom_id project}"
      end
    end
  end

  # Public projects page should have the right projects
  def verify_public_projects_page # rubocop:disable Metrics/AbcSize
    visit projects_path
    Project.published.each do |project|
      expect(page).to have_css "##{dom_id project}"
    end

    Project.unpublished.each do |project|
      expect(page).not_to have_css "##{dom_id project}"
    end
  end

  let!(:unpublished_project) { create :project }
  let!(:published_project) { create :published_project }

  before do
    create_pair :project
    create_pair :published_project
    admin = create :admin
    sign_in admin
    expect(page).to have_content t 'devise.sessions.signed_in'
    visit admin_projects_path
  end

  subject { page }
  it { should have_content t 'admins.projects.index.banner' }

  it 'lists all the projects' do
    verify_projects_tables
  end

  describe 'publishing a project' do
    before do
      click_link dom_id unpublished_project, :toggle_publish
    end

    it 'makes it show up in right table and publicly' do
      expect(unpublished_project.reload).to be_published
      verify_projects_tables
      verify_public_projects_page
    end
  end

  describe 'unpublishing a project' do
    before do
      click_link dom_id published_project, :toggle_publish
    end

    it 'makes it show up in right table and not publicly' do
      expect(published_project.reload).not_to be_published
      verify_projects_tables
      verify_public_projects_page
    end
  end

  describe 'editing a published project' do
    let(:new_description) { "This is a new description." }
    before do
      visit edit_admin_project_path published_project
      fill_in 'project_full_description', with: new_description
      click_button 'Update Project'
    end

    it 'updates the project' do
      expect(published_project.reload.full_description).to eql new_description
    end

    it 'updates the project show page' do
      visit project_path published_project
      expect(page).to have_content new_description
    end
  end
end
