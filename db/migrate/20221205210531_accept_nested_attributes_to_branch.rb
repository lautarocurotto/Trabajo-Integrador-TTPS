class AcceptNestedAttributesToBranch < ActiveRecord::Migration[7.0]
  def change
    accepts_nested_attributes_for :schedule
  end
end
