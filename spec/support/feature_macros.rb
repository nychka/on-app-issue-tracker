module FeatureMacros
	def login_user
		user = create(:user)
    visit user_session_path
    within("#new_user") do
      fill_in 'user_email', :with => user.email
      fill_in 'user_password', :with => user.password
    end
    click_on 'Sign in'
  end
  def create_hotel
    address = build(:address)
    hotel = build(:hotel)
    visit hotels_path
    expect(page).to have_content 'Добавити готель'
    page.find('#add-hotel').click
    p "Current url: #{current_url}"
    within("#new_hotel") do
     fill_in 'hotel_title', :with => hotel.title
     select hotel.star_rating, :from => "hotel_star_rating"
     check 'hotel_breakfast_included'
     fill_in 'hotel_room_description', :with => hotel.room_description
     fill_in 'hotel_price_for_room', :with => hotel.price_for_room
     attach_file('hotel_photo', File.join(Rails.root, 'spec', 'factories','image.png'))
     fill_in 'hotel_address_attributes_country', :with => address.country
     fill_in 'hotel_address_attributes_state', :with => address.state
     fill_in 'hotel_address_attributes_city', :with => address.city
     fill_in 'hotel_address_attributes_street', :with => address.street
   end
   click_on "Create Hotel"
 end
end
