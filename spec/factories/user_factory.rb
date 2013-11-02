# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  is_admin        :boolean          default(FALSE)
#  lat             :float
#  lng             :float
#  oauth_token     :string(255)
#

  # == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  is_admin        :boolean          default(FALSE)
#  lat             :float
#  lng             :float
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, :class => User do
    first_name            'Testie'
    last_name             'Testerson'
    email                 'test@test.com'
    password              'test'
    password_confirmation 'test'
    is_admin               false
  end

  factory :admin, :class => User do
    first_name            'Admin'
    last_name             'Administrator'
    email                 'admin@admin.com'
    password              'admin'
    password_confirmation 'admin'
    is_admin               true
  end

  factory :nil_user, :class => User do
    first_name            nil
    last_name             nil
    email                 nil
    password              nil
    is_admin              nil
  end
end
