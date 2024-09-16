class AddAffiliateLinkToPins < ActiveRecord::Migration[5.0]
  def change
    add_column :pins, :affiliate_link, :string
  end
end
