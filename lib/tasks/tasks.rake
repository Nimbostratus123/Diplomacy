path = ''
unless Rails.env.production?
	path = '/desktop/developer/rails/diplomacy'
end
require "~#{path}/app/helpers/application_helper.rb"
include ApplicationHelper

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

namespace :nations do

	desc 'Randomize User Nations' 
	task :shuffle => :environment do
		shuffled = nations.shuffle
		User.all.each_with_index do |user, index|
			user.update_attribute(:nation, shuffled[index])
		end
	end
	                                                             
end






namespace :centers do 
	
	
	desc 'Set Centers'
	task :reset => :environment do
		
		Center.all.each do |center|
			center.delete
		end
		
		User.all.each do |user|
			
			case user.nation
			when 'italy'
				Center.create!(:nation => user.nation, :location => 'roma')
				Center.create!(:nation => user.nation, :location => 'venezia')
				Center.create!(:nation => user.nation, :location => 'napoli')
			when 'russia'
				Center.create!(:nation => user.nation, :location => 'moscow')
				Center.create!(:nation => user.nation, :location => 'warsaw')
				Center.create!(:nation => user.nation, :location => 'saint petersburg')
				Center.create!(:nation => user.nation, :location => 'stevastopol')
			when 'france'
				Center.create!(:nation => user.nation, :location => 'paris')
				Center.create!(:nation => user.nation, :location => 'marsailles')
				Center.create!(:nation => user.nation, :location => 'brest')
			when 'england'
				Center.create!(:nation => user.nation, :location => 'london')
				Center.create!(:nation => user.nation, :location => 'edinburgh')
				Center.create!(:nation => user.nation, :location => 'liverpool')
			when 'germany'
				Center.create!(:nation => user.nation, :location => 'berlin')
				Center.create!(:nation => user.nation, :location => 'munich')
				Center.create!(:nation => user.nation, :location => 'kiel')
			when 'austria'
				Center.create!(:nation => user.nation, :location => 'vienna')
				Center.create!(:nation => user.nation, :location => 'budapest')
				Center.create!(:nation => user.nation, :location => 'trieste')
			when 'turkey'
				Center.create!(:nation => user.nation, :location => 'constantanople')
				Center.create!(:nation => user.nation, :location => 'smyrna')
				Center.create!(:nation => user.nation, :location => 'ankara')
			else
				raise 'Wrong nationality for a Center.'
			end
			
		end
		
		
	end
	
	
end

namespace :year do
	
	task :reset => :environment do
		
		Year.all.each { |y| y.delete }
		
		Year.create!(:count => 0)
		
	end
	
	
end




desc 'Reset the Game'
task :restart => ["nations:shuffle", "units:reset", "year:reset"] do
	puts 'There is now a new game.'
end
