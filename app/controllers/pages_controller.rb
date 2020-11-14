class PagesController < ApplicationController
  def home
  end

  def about
    membersyml = YAML.load_file('config/locales/en/members.yml')
    @members = membersyml['members']
    @alumni = membersyml['alumni']
  end

  def chapters
    all_chapters = t("chapters.chapters_list")
    @current_chapters = all_chapters.select do |slug, chap|
      chap[:status] == "current"
    end
    @markdown_chapter = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    begin
    @chapter = t("chapters.chapters_list.#{params[:slug]}", raise: true)
    rescue I18n::MissingTranslationData
      not_found
    end
  end

  def sponsors
  end

  def contract
  end

  def bitcoin
    @address = ENV['BITCOIN_ADDRESS']
  end

  def lets_encrypt
    render text: "4zimu9T1gQAs2IjSQBxTBC4QP8Gsvui4wfrXnsQ0XlU.7J9hcMdJvtoGXRre2NQKXRPnyf0SIsM90W5TGGdGaRI"
  end
end
