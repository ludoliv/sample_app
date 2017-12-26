require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'static_pages/home' # vérifie si le bon template est utilisé
    assert_select "a[href=?]", root_path, count: 2 # On recherche si il y a bien 2 fois un lien vers root
    assert_select "a[href=?]", help_path # On recherche si un lien vers help existe
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    get contact_path
    assert_select "title", full_title("Contact")
  end
end
