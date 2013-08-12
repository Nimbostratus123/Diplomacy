module MovesHelper
	
	def selectify(list)
		finish = []
		list.each do |item|
			finish += [[ item.split.map(&:capitalize).join(' '), item]]
		end
		return finish
	end
	
	
end