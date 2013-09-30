path = ''
unless Rails.env.production?
	path = '/desktop/developer/rails/diplomacy'
end
require "~#{path}/app/helpers/application_helper.rb"
require "~#{path}/app/helpers/units_helper.rb"
include ApplicationHelper
include UnitsHelper

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
			unit.destination = unit.location
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
		
		Center.delete_all
		
		nations.each do |nation|
			
			case nation
			when 'italy'
				Center.create!(:nation => nation, :location => 'roma')
				Center.create!(:nation => nation, :location => 'venezia')
				Center.create!(:nation => nation, :location => 'napoli')
			when 'russia'
				Center.create!(:nation => nation, :location => 'moscow')
				Center.create!(:nation => nation, :location => 'warsaw')
				Center.create!(:nation => nation, :location => 'saint petersburg')
				Center.create!(:nation => nation, :location => 'stevastopol')
			when 'france'
				Center.create!(:nation => nation, :location => 'paris')
				Center.create!(:nation => nation, :location => 'marsailles')
				Center.create!(:nation => nation, :location => 'brest')
			when 'england'
				Center.create!(:nation => nation, :location => 'london')
				Center.create!(:nation => nation, :location => 'edinburgh')
				Center.create!(:nation => nation, :location => 'liverpool')
			when 'germany'
				Center.create!(:nation => nation, :location => 'berlin')
				Center.create!(:nation => nation, :location => 'munich')
				Center.create!(:nation => nation, :location => 'kiel')
			when 'austria'
				Center.create!(:nation => nation, :location => 'vienna')
				Center.create!(:nation => nation, :location => 'budapest')
				Center.create!(:nation => nation, :location => 'trieste')
			when 'turkey'
				Center.create!(:nation => nation, :location => 'constantinople')
				Center.create!(:nation => nation, :location => 'smyrna')
				Center.create!(:nation => nation, :location => 'ankara')
			else
				raise 'Wrong nationality for a Center.'
			end
			
		end
		
		
		Center.create!(:location => 'norway')
		Center.create!(:location => 'sweden')
		Center.create!(:location => 'denmark')
		Center.create!(:location => 'holland')
		Center.create!(:location => 'belgium')
		Center.create!(:location => 'portugal')
		Center.create!(:location => 'spain')
		Center.create!(:location => 'tunisia')
		Center.create!(:location => 'greece')
		Center.create!(:location => 'bulgaria')
		Center.create!(:location => 'serbia')
		Center.create!(:location => 'rumania')
		
		Center.all.each do |center|
			center.latest = center.nation
		end
		
	end
	
	
end

namespace :year do
	
	task :reset => :environment do
		
		Year.delete_all
		
		Year.create!(:count => 0)
		
	end
	
	
end




desc 'Reset the Game'
task :restart => ["nations:shuffle", "units:reset", "year:reset", "centers:reset"] do
	puts 'There is now a new game.'
end

desc 'Movement'

task :movement => :environment do
	movement
	puts 'Movement has occured.'
end