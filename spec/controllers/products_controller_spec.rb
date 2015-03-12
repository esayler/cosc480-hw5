require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe 'root route' do
    it "routes to products#index" do
      expect(:get => '/').to route_to(:controller => "products", :action => "index")
    end
  end

  describe 'GET #index' do
    context 'with params[:sort]' do
      it "should route correctly" do
        get :index
        expect(response.status).to eq(200)
      end
      it "should render the :index template and sorts by params " do
        get :index, sort: "name"
        expect(response). to render_template :index
      end
    end
    context 'without params[:filter]' do
      it "should routes correctly" do
      end
      it "should render the :index template and sort by name by default" do
        woody = FactoryGirl.create(:product, name: "Woody")
        potato_head = FactoryGirl.create(:product, name: "Mr. Potato Head")
        expect(Product).to receive(:sorted_by).with("name") { [potato_head, woody] }
        get :index
        expect(response).to render_template(:index)
        expect(assigns(:products)).to match_array([potato_head, woody])
      end
    end
    context 'without params[:filter]' do
      it "should route correctly" do
        #TODO
      end
      it "should render the :index template and sort by name " do
        #TODO
      end
    end
  end

  describe 'GET #show' do
    it "should route correctly" do
      # more failures...TODO: figure this out
      p = FactoryGirl.create(:product)
      get :show, id: p
      expect(response.status).to eq(200)
    end

    it "should assign the requested product to @product" do
      p = FactoryGirl.create(:product)
      # more failures...TODO: figure this out
      get :show, id: p
      expect(assigns(:product)).to eq p
    end

    it "should render the show template" do
      p = FactoryGirl.create(:product)
      get :show, id: p
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it "should assign a new Product to @product" do
      get :new
      expect(assigns(:product)).to be_a_new(Product)
    end
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "should assign the requested product to @product" do
      # somethings wrong here...
      p = FactoryGirl.create(:product)
      get :edit, id: p
      expect(assigns(:product)).to eq p
    end
    it "should render the :edit template" do
      p = FactoryGirl.create(:product)
      get :edit, id: p
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it "should save the new product in the database" do
      end
      it "redirects to the products#index" do
        p = FactoryGirl.create(:product)
        expect(Product).to receive(:new) { p }
        expect(p).to receive(:save) { true }
        expect{ post :create, p }.to change(Product, :count).by(1)
        expect(response).to redirect_to product_path(assigns[:product])
        expect(flash[:notice]).to be_present
      end
    end
  end

  describe 'PATCH #update' do
    before :each do
      @product = FactoryGirl.create(:product, name: 'Dummy', description: 'blah')
    end

    context 'with valid attributes' do
      it "should find the requested @product" do
        # this is wrong...
        patch :update, id: @product
        expect(assigns(:product)).to eq(@product)
      end
      it "should update the product in the database" do
        patch :update, id: @product
        @product.reload
        expect(@product.name).to eq('Dummy')
        expect(@product.description).to eq('blah')
      end

      it "should redirect to the products#show" do
        post :create, id: @product
        expect(response).to redirect_to @product
        expect(flash[:notice]).to be_present
      end
    end
  end

  #describe 'DELETE #destroy' do
    #before :each do
      #@product = FactoryGirl.create(:product)
    #end

    #it "deletes the product from the database" do
      #expect{
        #delete :destroy, id: @product
      #}.to change(Product, :count).by(-1)
    #end

    #it "redirects to products#index" do
      #delete :destroy, id: @product
      #expect(response).to redirect_to products_path
    #end
  #end
end
