module TasksHelper
	def get_tag_name str_tag_ids
		@str_tag_name = ''
		str_tag_ids = str_tag_ids.split(',')
		str_tag_ids.each do |str_tag_id|
			tag = Tag.find(str_tag_id)
			if @str_tag_name == ''
				@str_tag_name = link_to tag.name, tag_search_path(str_tag_id)
			else
				@str_tag_name.concat(",")
				@str_tag_name.concat(link_to tag.name, tag_search_path(str_tag_id))
			end
		end
		return @str_tag_name
	end
end
