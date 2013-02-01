require 'rubygems'
require 'pry'
require './Library.rb'
require 'date'
class LibraryManagment
 include Library
	attr_accessor :book,:book_issue_id,:book_issuer_id
	
	def initialize
		@book=Book.new

	end
		
	def create_book(book_name,book_author,book_isdn,book_status)
	
		@book.add_new_book(book_name,book_author,book_isdn,book_status)
	
	end
	
	def issue_book(issue_id,issuer_id,book_name,book_isdn,issue_date=Date.new(2013,1,1))
		
		if @book.search_book(book_name,nil,nil,"status")=="Issued"
		
			puts "Book already Issued"

		else
	  	@book_issue_id=issue_id
	  	@book_issuer_id=issuer_id
	  	@book.name=book_name
	  	@book.isdn=book_isdn
	  	@book.change_status(book_name,'Issued',issue_date,issue_date+15)		
		end
	
	end

	def return_book(book_name,return_date=Date.new(2013,2,17))
	
		if @book.check_validity(book_name)<0
			puts"Book returned after due date"
			puts "Fine of Rs.5 per day is imposed"
			puts "Fine amount= #{@book.check_validity(book_name) * 5}"
			@book.change_status(book_name,"Not_Issued")
	
		else
			#@book.search_book('Not_Issued')
	
		end
	
	end	
	
	

	def search_book(book_name=nil,book_author=nil,book_isdn=nil)
		@book.search_book(book_name,book_author,book_isdn)
	end
end

lib=LibraryManagment.new
lib.create_book("ruby","amar","1","not_issued")
lib.create_book("c","xyz","3","Not_Issued")
lib.create_book("java","pqr","2","Not_Issued")

#lib.create_book()
lib.issue_book("01","s01","ruby","1")
binding.pry
