class NonprofitApplicationsCs169PoolNotNull < ActiveRecord::Migration
  def change
    change_column_null :nonprofit_applications, :cs169_pool, false, false
  end
end
