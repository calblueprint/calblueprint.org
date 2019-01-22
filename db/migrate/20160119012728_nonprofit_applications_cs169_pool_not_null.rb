class NonprofitApplicationsCs169PoolNotNull < ActiveRecord::Migration[4.2]
  def change
    change_column_null :nonprofit_applications, :cs169_pool, false, false
  end
end
