class ItemsController < ApplicationController

  def home 
    redirect_to("/items")
  end

  def index
    matching_items = Item.all

    @list_of_items = matching_items.order({ :created_at => :desc })

    render({ :template => "items/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_items = Item.where({ :id => the_id })

    @the_item = matching_items.at(0)

    render({ :template => "items/show.html.erb" })
  end

  def create
    the_item = Item.new
    user_id = session.fetch(:user_id)
    the_item.description = params.fetch("query_description")
    # the_item.category_id = params.fetch("query_category_id")

    category_name = params.fetch("query_category_name")
    category = Category.where({ :category => category_name})

    if category.count != 0
      category = category.at(0)
      the_item.category_id = category.id
    else 
      new_category = Category.new
      new_category.category = category_name
      new_category.save
      the_item.category_id = new_category.id
    end

    the_item.image_link = params.fetch("query_image_link")
    the_item.owner_id = user_id
    # the_item.borrower_id = params.fetch("query_borrower_name")
    borrower_name = params.fetch("query_borrower_name")
    matching_borrower = Borrower.where({ :name => borrower_name})
    if matching_borrower.count != 0
      matching_borrower = matching_borrower.at(0)
      the_item.borrower_id = matching_borrower.id
    else 
      new_borrower = Borrower.new
      new_borrower.name = borrower_name
      new_borrower.save
      the_item.borrower_id = new_borrower.id
    end

    if the_item.valid?
      the_item.save
      redirect_to("/items", { :notice => "Item created successfully." })
    else
      redirect_to("/items", { :alert => the_item.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_item = Item.where({ :id => the_id }).at(0)

    the_item.description = params.fetch("query_description")
    # the_item.category_id = params.fetch("query_category_id")
    category_name = params.fetch("query_category_name")
    updated_category = Category.where({ :category => category_name})
    if updated_category.count != 0
      updated_category = updated_category.at(0)
      the_item.category_id = updated_category.id
    else 
      new_category = Category.new
      new_category.category = category_name
      new_category.save
      the_item.category_id = new_category.id
    end
    the_item.image_link = params.fetch("query_image_link")
    # the_item.borrower_id = params.fetch("query_borrower_name")
    borrower_name = params.fetch("query_borrower_name")
    matching_borrower = Borrower.where({ :name => borrower_name})
    if matching_borrower.count != 0
      matching_borrower = matching_borrower.at(0)
      the_item.borrower_id = matching_borrower.id
    else 
      new_borrower = Borrower.new
      new_borrower.category = borrower_name
      new_borrower.save
      the_item.borrower_id = new_borrower.id
    end

    if the_item.valid?
      the_item.save
      redirect_to("/items/#{the_item.id}", { :notice => "Item updated successfully."} )
    else
      redirect_to("/items/#{the_item.id}", { :alert => the_item.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_item = Item.where({ :id => the_id }).at(0)

    the_item.destroy

    redirect_to("/items", { :notice => "Item deleted successfully."} )
  end
end
