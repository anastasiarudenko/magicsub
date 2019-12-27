class CreateShifts < ActiveRecord::Migration[6.0]
  def change
    create_table :shifts do |t|
      t.bignum :time
      t.string :file

      t.timestamps
    end
  end
end
