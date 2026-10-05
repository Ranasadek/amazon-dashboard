USE amazon_db;

-- 1. المؤشرات الرئيسية للمشروع (KPIs)
SELECT 
    COUNT(DISTINCT product_id) AS total_products,
    ROUND(AVG(discounted_price), 2) AS avg_discounted_price,
    ROUND(AVG(actual_price), 2) AS avg_actual_price,
    ROUND(AVG(discount_percentage) * 100, 1) AS avg_discount_pct,
    ROUND(AVG(rating), 2) AS avg_rating
FROM amazon_cleaned;

-- 2. أعلى الفئات الرئيسية حَسب عدد المنتجات
SELECT 
    category,
    COUNT(*) AS total_products,
    ROUND(AVG(discounted_price), 2) AS avg_price,
    ROUND(AVG(rating), 2) AS avg_rating
FROM amazon_cleaned
GROUP BY category
ORDER BY total_products DESC
LIMIT 5;

-- 3. أعلى 10 منتجات تقييماً
SELECT 
    product_name,
    category,
    discounted_price,
    rating,
    rating_count
FROM amazon_cleaned
WHERE rating IS NOT NULL
ORDER BY rating DESC, rating_count DESC
LIMIT 10;