FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'aaaaa1'}
    password_confirmation {password}
    last_name             {'ア'} 
    first_name            {'ア'} 
    last_name_kana        {'ア'} 
    first_name_kana       {'ア'} 
    birthday            {'2021-11-09'}

  end
end