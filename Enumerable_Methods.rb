
module Enumerable
#my_each
	def my_each
		return self.to_enum unless block_given?
		for i in self
			yield(i)
		end
		self
	end

#my_each_with_index
	def my_each_with_index
		return self.to_enum unless block_given?
		index = 0
		for i in self
			yield(i, index)
			index += 1
		end
		self
	end	

#my_select
	def my_select
		return self.to_enum unless block_given?
		new_ary = []
		for i in self
			new_ary << i if yield(i)
		end
		new_ary
	end	

#my_all?
	def my_all? 
		return true unless block_given?
		for i in self
			if yield(i) != true
				return false
			end
		end
		true
	end

#my_any?
	def my_any?
		unless block_given?
			if self.empty?
				return false
			else return true
			end
		end
		for i in self
			if yield(i) == true
				return true
			end
		end
		false
	end

#my_none?
	def my_none?
		unless block_given?
			if self.empty?
				return true
			else return false
			end
		end
		for i in self
			if yield(i) == true
				return false
			end 
		end
		true
	end

#my_count
	def my_count(arg = nil)
		count = 0
		for i in self
			if (arg == nil) && (!block_given?)
				return self.length
			elsif (arg != nil)
				count += 1 if i == arg
			elsif (arg == nil) && (block_given?)
				count += 1 if yield(i) == true
			end
		end
		count
	end

#my_map
	def my_map
		return self.to_enum unless block_given?
		new_ary = []
		for i in self
			new_ary << yield(i)
		end
		new_ary
	end

#my_map accepts proc as well
	def my_map_proc(a_proc = nil)
		new_ary = []
		if a_proc.is_a?(Proc)
			for i in self
				new_ary << a_proc.call(i)
			end
		else
			for i in self
				new_ary << yield(i)
			end
		end
		new_ary
	end
end
