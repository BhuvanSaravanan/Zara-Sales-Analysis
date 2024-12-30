# Case Study: Exploring Customer Purchase Patterns and Product Performance (ZARA)
This Zara sales dataset contains information about product sales from Zara stores over a specific period of time. The dataset includes various attributes relevant to sales, such as product ID, product name, product category, price, sales volume, sales date, and store location. This data can be used to analyze product sales trends, sales performance across different product categories, the effectiveness of promotions, customer purchasing patterns, and other factors that influence Zara's sales performance. Analyzing this dataset can provide valuable insights for Zara management in optimizing marketing strategies, inventory management, and other decision-making processes to enhance revenue and profitability.

# Data Structure Overview

### Entity-Relationship Diagram

![image](https://github.com/user-attachments/assets/6be2335e-2213-414c-b594-ef8111b6ca58)
![image](https://github.com/user-attachments/assets/bd7af280-1d6c-46a3-855e-5305a8561c25)


### Entity-Relationship Model Tables

## 1. Product
| Field          | Description                                                                                      | Data Type |
|-----------------|--------------------------------------------------------------------------------------------------|-----------|
| **ProductID**   | Unique identifier for each product.                                                             | INT       |
| **Name**        | Name of the product.                                                                            | NVARCHAR(255) |
| **Description** | Description of the product.                                                                     | NVARCHAR(MAX) |
| **Price**       | Price of the product.                                                                           | FLOAT     |
| **Currency**    | Currency of the product price.                                                                  | NVARCHAR(10) |
| **Brand**       | Brand of the product.                                                                           | NVARCHAR(255) |
| **SKU**         | Stock Keeping Unit, a unique code used to identify items available for sale.                    | NVARCHAR(50) |
| **URL**         | Product URL (e.g., if the product is sold online).                                              | NVARCHAR(MAX) |
| **CategoryID**  | Foreign key linking to the Category table.                                                      | INT       |
| **PromotionID** | Foreign key linking to the Promotion table.                                                     | INT       |

---

## 2. Category
| Field              | Description                                                                                      | Data Type |
|---------------------|--------------------------------------------------------------------------------------------------|-----------|
| **CategoryID**      | Unique identifier for each category.                                                            | INT       |
| **ProductCategory** | The category of the product, such as clothing, accessories, shoes, etc.                         | NVARCHAR(255) |
| **Section**         | Section or category where the product is sold in the store (e.g., women's clothing, men's clothing, etc.). | NVARCHAR(255) |

---

## 3. Promotion
| Field         | Description                                                                                      | Data Type |
|---------------|--------------------------------------------------------------------------------------------------|-----------|
| **PromotionID** | Unique identifier for each promotion.                                                         | INT       |
| **Promotion** | Indicator of whether the product is currently on promotion or not.                              | BIT       |
| **Seasonal**  | Indicator of whether the product is part of a specific seasonal collection.                     | BIT       |

---

## 4. Sales
| Field              | Description                                                                                      | Data Type |
|---------------------|--------------------------------------------------------------------------------------------------|-----------|
| **SalesID**         | Unique identifier for each sales record.                                                        | INT       |
| **ProductID**       | Foreign key linking to the Product table.                                                       | INT       |
| **SalesVolume**     | The quantity of products sold.                                                                  | INT       |
| **ProductPosition** | The position of the product in the catalog or store layout.                                     | NVARCHAR(255) |
| **ScrapedAt**       | The time when the data was scraped (e.g., in web scraping process).                             | DATETIME  |


## Executive Summary
## Insight DeepDive

1. Men are more inclined towards premium products even during promotions, paying an average of $99.68 compared to women’s $48.37.
2. Women exhibit strategic purchasing behavior, spending less on promotional products ($48.37) but more on non-promotional products ($52.68) than the average of $50.53
3. Promoted products underperform in sales within aisles (-13.14%) and front-of-store (-17.96%) placements compared to non-promoted products.
4. However, end-cap promotions drive success, delivering a +5.3% sales uplift versus non-promoted products.
## Recommendation 
