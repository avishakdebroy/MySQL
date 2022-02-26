/* How many visitors reached hits_page_pageTitle = 'Checkout Confirmation'? */

SELECT
  COUNT(DISTINCT fullVisitorId ) AS visitor_count,
  hits_page_pageTitle
FROM
  `data-to-insights.ecommerce.rev_transactions`
WHERE
  LOWER(hits_page_pageTitle)= 'checkout confirmation'
GROUP BY
  hits_page_pageTitle

/* Average product ordered by distinct visitors in geoNetwork_city */

SELECT
  geoNetwork_city,
  SUM(totals_transactions) AS total_products_ordered,
  COUNT(DISTINCT fullVisitorId) AS distinct_visitor,
  SUM(totals_transactions)/COUNT(DISTINCT fullVisitorId) AS avg_products_ordered
FROM
  `data-to-insights.ecommerce.rev_transactions`
GROUP BY
  geoNetwork_city
HAVING
  avg_products_ordered > 20
ORDER BY
  avg_products_ordered DESC

/* number of products in each hits_product_v2ProductCategory */

SELECT
  COUNT(DISTINCT hits_product_v2ProductName) AS number_of_products,
  hits_product_v2ProductCategory
FROM
  `data-to-insights.ecommerce.rev_transactions`
WHERE
  hits_product_v2ProductName IS NOT NULL
GROUP BY
  hits_product_v2ProductCategory
ORDER BY
  number_of_products DESC
LIMIT
  10
