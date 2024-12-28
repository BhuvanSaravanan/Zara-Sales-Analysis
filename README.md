# Case Study: Exploring Customer Purchase Patterns and Product Performance (ZARA)
This Zara sales dataset contains information about product sales from Zara stores over a specific period of time. The dataset includes various attributes relevant to sales, such as product ID, product name, product category, price, sales volume, sales date, and store location. This data can be used to analyze product sales trends, sales performance across different product categories, the effectiveness of promotions, customer purchasing patterns, and other factors that influence Zara's sales performance. Analyzing this dataset can provide valuable insights for Zara management in optimizing marketing strategies, inventory management, and other decision-making processes to enhance revenue and profitability.

# Data Structure Overview

## Entity-Relationship Model Tables

![image](https://github.com/user-attachments/assets/6be2335e-2213-414c-b594-ef8111b6ca58)


## 1. Product
| Field          | Description                                                                                      | Data Type |
|-----------------|--------------------------------------------------------------------------------------------------|-----------|
| **Product ID**  | Unique identifier for each product.                                                             | INT       |
| **Name**        | Name of the product.                                                                            | STR       |
| **Description** | Description of the product.                                                                     | STR       |
| **Price**       | Price of the product.                                                                           | FLOAT     |
| **Currency**    | Currency of the product price.                                                                  | STR       |
| **Brand**       | Brand of the product.                                                                           | STR       |
| **SKU**         | Stock Keeping Unit, a unique code used to identify items available for sale.                    | STR       |
| **URL**         | Product URL (e.g., if the product is sold online).                                              | STR       |

---

## 2. Category
| Field              | Description                                                                                      | Data Type |
|---------------------|--------------------------------------------------------------------------------------------------|-----------|
| **Product Category**| The category of the product, such as clothing, accessories, shoes, etc.                         | STR       |
| **Section**         | Section or category where the product is sold in the store (e.g., women's clothing, men's clothing, etc.). | STR |

---

## 3. Promotion
| Field         | Description                                                                                      | Data Type |
|---------------|--------------------------------------------------------------------------------------------------|-----------|
| **Promotion** | Indicator of whether the product is currently on promotion or not.                              | BOOL      |
| **Seasonal**  | Indicator of whether the product is part of a specific seasonal collection.                     | BOOL      |

---

## 4. Sales
| Field              | Description                                                                                      | Data Type |
|---------------------|--------------------------------------------------------------------------------------------------|-----------|
| **Sales Volume**    | The quantity of products sold.                                                                  | INT       |
| **Product Position**| The position of the product in the catalog or store layout.                                     | STR       |
| **Scraped_at**      | The time when the data was scraped (e.g., in web scraping process).                             | DATETIME  |


## Executive Summary
## Insight DeepDive
## Recommendation 
