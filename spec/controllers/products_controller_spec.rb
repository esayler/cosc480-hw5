require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe "root route" do
    it "routes to products#index" do
      expect(:get => '/').to route_to(:controller => "products", :action => "index")
    end
  end

  describe "GET #index" do
    context 'with params[:filter] and params[:sort]' do
      it "routes correctly" do
        get :index
        expect(response.status).to eq(200)
      end
      it 'renders rendres the :index template and sorts by '

     end
    context 'without params[:filter]' do
      it "routes correctly" do

      end
      it "renders the :index template and sorts by name by default" do
        x, y = Product.create!, Product.create!
        expect(Product).to receive(:sorted_by).with("name") { [x,y] }
        get :index
        expect(response).to render_template(:index)
        expect(assigns(:products)).to match_array([x,y])
      end
    context 'without params[:filter]' do
      it "routes correctly" do
      it 'renders the :index template and sorts by '
    end
  end

  describe "GET #show" do
    it "routes correctly" do
      expect(Product).to receive(:find).with("1") { p }
      get :show, id: 1
      p = Product.new
      expect(response.status).to eq(200)
    end

    it "renders the show template" do
      expect(Product).to receive(:find).with("1") { p }
      get :show, id: 1
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    it "assigns a new Product to @product"
    it "renders the :new template"
  end

  describe 'GET #edit' do
    it "assigns the requested product to @product"
    it "renders the :edit template"
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new product in the database"
      
      it "redirects to the products#index" do
        p = Product.new
        #Product.should_receive(:new).and_return(p)
        expect(Product).to receive(:new) { p }

        #p.should_receive(:save).and_return(true)
        expect(p).to receive(:save) { true }

        post :create, { :product => { "name" => "dummy", "price" => "11.50" } }

        #response.should redirect_to(products_path)
        expect(response).to redirect_to(products_path)
      end
    end
    context "with invalid attributes" do
      it "does not save the new product in the database"
      it "rerenders the :new template" do
        p = Product.new
        #Product.should_receive(:new).and_return(p)
        expect(Product).to receive(:new) { p }

        #p.should_receive(:save).and_return(nil)
        expect(p).to receive(:save) { nil }

        post :create, { :product => { "name"=>"dummy", "price"=>"11.50" } }

        #response.should redirect_to(new_product_path)
        expect(response).to redirect_to(new_product_path)
      end
    end
  end

  describe 'PATCH #update' do
    context "with valid attributes" do
      it "updates the product in the database"
      it "redirect to the product"
    end

    context "with invalid attributes" do
      it "does not update the product"
      it "re-renders the :edit template"
    end
  end

  describe 'DELETE #destroy' do
    it "deletes the product from the database"
    it "redirects to products#index"
    before(:each) do
      Product.create! :name => "name", :price => 19.99, ... (other product details)
    end
    
    it "should delete the product" do
      expect
    end
  end
end
