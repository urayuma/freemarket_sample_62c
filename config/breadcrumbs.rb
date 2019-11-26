crumb :root do
  link "トップページ", root_path
end

crumb :mypage do
  link "マイページ", mypage_index_path
end

crumb :edit do |_edit|
  link "プロフィール", edit_mypage_index_path
  parent :mypage
end

crumb :card do |_card|
  link "支払い方法", card_mypage_index_path
  parent :mypage
end

crumb :card_new do |_card|
  link "クレジットカード情報入力", card_new_mypage_index_path
  parent :card
end

crumb :identification do |_identification|
  link "本人情報の登録", identification_mypage_index_path
  parent :mypage
end

crumb :in_progress do |_progress|
  link "出品した商品 - 取引中", listings_in_progress_mypage_index_path
  parent :mypage
end

crumb :listing do |_listing|
  link "出品した商品 - 出品中", listings_listing_mypage_index_path
  parent :mypage
end

crumb :completed do |_completed|
  link "出品した商品 - 売却済み", purchase_mypage_index_path
  parent :mypage
end

crumb :logout do |_logout|
  link "ログアウト", logout_mypage_index_path
  parent :mypage
end

crumb :purchase do |_purchase|
  link "購入した商品 - 取引中", purchase_mypage_index_path
  parent :mypage
end

crumb :purchased do |_purchased|
  link "購入した商品 - 過去の取引", purchased_mypage_index_path
  parent :mypage
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
