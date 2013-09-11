
namespace :units do
	desc "Reset Units"
	task :reset => [:environment, :delete] do
		User.all.each do |user|
			
			case user.nation
			when 'italy'
				user.units.create!(:location => 'roma', :kind => 'army')
				user.units.create!(:location => 'venezia', :kind => 'army')
				user.units.create!(:location => 'napoli', :kind => 'fleet')
			when 'russia'
				user.units.create!(:location => 'moscow', :kind => 'army')
				user.units.create!(:location => 'warsaw', :kind => 'army')
				user.units.create!(:location => 'saint petersburg', :kind => 'fleet')
				user.units.create!(:location => 'stevastopol', :kind => 'fleet')
			when 'france'
				user.units.create!(:location => 'paris', :kind => 'army')
				user.units.create!(:location => 'marseilles', :kind => 'army')
				user.units.create!(:location => 'brest', :kind => 'fleet')
			when 'england'
				user.units.create!(:location => 'london', :kind => 'fleet')
				user.units.create!(:location => 'edinburgh', :kind => 'fleet')
				user.units.create!(:location => 'liverpool', :kind => 'army')
			when 'germany'
				user.units.create!(:location => 'berlin', :kind => 'army')
				user.units.create!(:location => 'munich', :kind => 'army')
				user.units.create!(:location => 'kiel', :kind => 'fleet')
			when 'austria'
				user.units.create!(:location => 'vienna', :kind => 'army')
				user.units.create!(:location => 'budapest', :kind => 'army')
				user.units.create!(:location => 'trieste', :kind => 'fleet')
			when 'turkey'
				user.units.create!(:location => 'constantinople', :kind => 'army')
				user.units.create!(:location => 'smyrna', :kind => 'army')
				user.units.create!(:location => 'ankara', :kind => 'fleet')
			else
				raise 'There is no such nation'
			end
		
		end
    	
		Unit.all.each do |unit|
			unit.support = 0
			unit.delay = 0
			unit.save!
		end
		
	end
	
	desc "Delete Units"
	task :delete => :environment do 
		Unit.all.each { |unit| unit.delete }
	end
	
end