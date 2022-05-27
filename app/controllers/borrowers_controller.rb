class BorrowersController < ApplicationController
  def index
    matching_borrowers = Borrower.all

    @list_of_borrowers = matching_borrowers.order({ :created_at => :desc })

    render({ :template => "borrowers/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_borrowers = Borrower.where({ :id => the_id })

    @the_borrower = matching_borrowers.at(0)

    render({ :template => "borrowers/show.html.erb" })
  end

  def create
    the_borrower = Borrower.new
    the_borrower.name = params.fetch("query_name")

    if the_borrower.valid?
      the_borrower.save
      redirect_to("/borrowers", { :notice => "Borrower created successfully." })
    else
      redirect_to("/borrowers", { :alert => the_borrower.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_borrower = Borrower.where({ :id => the_id }).at(0)

    the_borrower.name = params.fetch("query_name")

    if the_borrower.valid?
      the_borrower.save
      redirect_to("/borrowers/#{the_borrower.id}", { :notice => "Borrower updated successfully."} )
    else
      redirect_to("/borrowers/#{the_borrower.id}", { :alert => the_borrower.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_borrower = Borrower.where({ :id => the_id }).at(0)

    the_borrower.destroy

    redirect_to("/borrowers", { :notice => "Borrower deleted successfully."} )
  end
end
