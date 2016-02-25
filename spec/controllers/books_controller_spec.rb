require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe "GET #index" do
    it "returns a successful http request status code" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns a successful http request status code" do
      book = Fabricate(:book)
      get :show,id: book.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns a successful http request status code" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST  #create" do
    context "a successful create" do
      before do
        post :create, book: Fabricate.attributes_for(:book)
      end

      it "saves the new book object" do
        expect(Book.count).to eq(1)
      end

      it "redirects to the book show action" do
        expect(response).to redirect_to book_path(Book.last)
      end

      it "sets the success flash message" do
        expect(flash[:success]).to eq("Book has been created")
      end
    end

    context "an unsuccessful create" do
      it "does not save the book object with invalid inputs" do
        post :create, book: Fabricate.attributes_for(:book, title: nil)
        expect(Book.count).to eq (0)
      end
      it "sets the failure flash message" do
        post :create, book: Fabricate.attributes_for(:book, title: nil)
        expect(flash[:danger]).to eq ("Book has not been created")
      end
    end
  end

  describe "GET #edit" do
    let(:book) {Fabricate(:book)}

    it "sends a successful edit request" do
      get :edit, id: book
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    context "successful update" do
      let(:sajid) { Fabricate(:book, title: "Book title") }

      it "updates the modified book object" do
        put :update, book: Fabricate.attributes_for(:book, title: "Awsome Book title"), id: sajid.id
        expect(Book.last.title).to eq("Awsome Book title")
        expect(Book.last.title).not_to eq("Book title")
      end

      it "sets the success flash message" do
        put :update, book: Fabricate.attributes_for(:book, title: "Awsome Book title"), id: sajid.id
        expect(flash[:success]).to eq("Book has been updated")
      end

      it "it redirects to the show action" do
        put :update, book: Fabricate.attributes_for(:book, title: "Awsome Book title"), id: sajid.id
        expect(response).to redirect_to(book_path(Book.last))
      end
    end

    context "unsuccessful update" do
      let(:sajid) { Fabricate(:book, title: "Book title") }

      it "does not updates the book object with invalid input" do
        put :update, book: Fabricate.attributes_for(:book, title: nil), id: sajid.id
        expect(Book.last.title).to eq("Book title")
      end

      it "sets the failure flash message" do
        put :update, book: Fabricate.attributes_for(:book, title: nil), id: sajid.id
        expect(flash[:danger]).to eq("Book has not been updated")
      end
    end
  end

  describe "Delete #destroy" do
    let(:book) { Fabricate(:book) }

    it "deletes the book with the given id" do
      delete :destroy, id: book.id

      expect(Book.count).to eq(0)

    end

    it "sets the flash message" do
      delete :destroy, id: book.id

      expect(flash[:success]).to eq("Book has been deleted")
    end

    it "redirects to the index action" do
      delete :destroy, id: book.id

      expect(response).to redirect_to books_path
    end
  end
end
