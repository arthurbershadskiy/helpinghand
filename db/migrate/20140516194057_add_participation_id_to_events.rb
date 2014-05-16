class AddParticipationIdToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :participation_id, :integer
  	
  end
end
