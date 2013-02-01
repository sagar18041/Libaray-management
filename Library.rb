require 'rubygems'
require 'pry'
require 'date'
module Library

	class Book
		@@count=1
		attr_accessor :book_id,:books,:name,:author,:isdn,:status,:issue_date,:return_date
		
		def initialize

			@books=Hash.new
		end	

		def add_new_book(book_name,book_author,book_isdn,book_status)

			@book_id=@@count
	 	  @books[@book_id]=[book_name,book_author,book_isdn,book_status]
			@@count+=1
		end

		def search_book(book_name=nil,book_author=nil,book_isdn=nil,return_detail=nil)
			
			@books.each_value do |name,author,isdn,status|
				if name==book_name || author==book_author || isdn==book_isdn
					if return_detail=="status"
						return status

					else

						puts "Book name=#{name}" 
						puts "Book author=#{author}" 
						puts "Book isdn number=#{isdn}" 
						puts "Book status=#{status}"
			  	end
			  end
			end
		end

		def change_status(book_name,status,book_issue_date,book_return_date)
			temp=0
			@books.each do |k,v|
				if v.include?(book_name)
					
					temp=k
				end
			end	
			if status=="Issued"
				@books[temp][3]=status
				@books[temp][4]=book_issue_date
				@books[temp][5]=book_return_date	
			else
				@books[temp][3]=status
			end
		end	

		def check_validity(book_name)
			@books.each_value do |name,author,isdn,status,issue_date,return_date|
				if name==book_name && status=="Issued"
					return (return_date-Date.today).to_i 
			  end
			end
		end	
	
	end
#b=Book.new
#b.add_new_book("c","xyz","1","Not_Issued")
#b.add_new_book("java","pqr","2","Not_Issued")
#b.add_new_book("ruby","matso","3","Not_Issued")
#binding.pry


end
