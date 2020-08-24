# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PageMonitor.create(
  url: 'https://www.getrxd.com/getrxdpremiumbumperplates.html',
  name: 'GetRXd Bumper Plates',
  frequency: 10.minutes,
  selections: [
    "//form[@id='product_addtocart_form']/div[@class='span12']/div[@class='row-fluid']/div[contains(@class,'product-shop')]/div[@class='row-fluid']/div[contains(@class,'price-info')]/p[contains(@class,'availability-configurable')]",
    "//form[@id='product_addtocart_form']/div[@class='span12']/div[@class='row-fluid']/div[contains(@class,'product-shop')]/table[contains(@class,'data-table')]/tbody/tr[not(contains(@class, 'out-of-stock-group-product'))]"
  ]
)
