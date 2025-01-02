
<img src="https://github.com/user-attachments/assets/95117c56-ac89-4356-9ec4-6e293c6d159a" width="1000" height="200">

# Project Background: Exploring Customer Purchase Patterns and Product Performance 
Zara is a renowned multinational retail company founded in 1974 in Spain, as part of the Inditex group, which is one of the largest fashion retailers in the world. Zara specializes in fast fashion, offering trendy clothing, accessories, and footwear for men, women, and children. The brand is known for its ability to quickly bring the latest fashion trends from the runway to its stores, often with turnaround times as short as two weeks. With a commitment to sustainability, Zara has also been integrating eco-friendly practices into its operations, including using organic fabrics and reducing waste.

# Data Structure Overview

This Zara sales dataset contains 252 records and information about product sales from Zara stores over a specific period of time. The dataset includes various attributes relevant to sales, such as product ID, product name, product category, price, sales volume, sales date, and store location. This data can be used to analyze product sales trends, sales performance across different product categories, the effectiveness of promotions, customer purchasing patterns, and other factors that influence Zara's sales performance. Analyzing this dataset can provide valuable insights for Zara management in optimizing marketing strategies, inventory management, and other decision-making processes to enhance revenue and profitability.

### Entity-Relationship Diagram

<img src="https://github.com/user-attachments/assets/6be2335e-2213-414c-b594-ef8111b6ca58" width="800" height="400">
<img src="https://github.com/user-attachments/assets/bd7af280-1d6c-46a3-855e-5305a8561c25" width="800" height="400">

### Entity-Relationship Model Tables

### 1. Product
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

### 2. Category
| Field              | Description                                                                                      | Data Type |
|---------------------|--------------------------------------------------------------------------------------------------|-----------|
| **CategoryID**      | Unique identifier for each category.                                                            | INT       |
| **ProductCategory** | The category of the product, such as clothing, accessories, shoes, etc.                         | NVARCHAR(255) |
| **Section**         | Section or category where the product is sold in the store (e.g., women's clothing, men's clothing, etc.). | NVARCHAR(255) |

---

### 3. Promotion
| Field         | Description                                                                                      | Data Type |
|---------------|--------------------------------------------------------------------------------------------------|-----------|
| **PromotionID** | Unique identifier for each promotion.                                                         | INT       |
| **Promotion** | Indicator of whether the product is currently on promotion or not.                              | BIT       |
| **Seasonal**  | Indicator of whether the product is part of a specific seasonal collection.                     | BIT       |

---

### 4. Sales
| Field              | Description                                                                                      | Data Type |
|---------------------|--------------------------------------------------------------------------------------------------|-----------|
| **SalesID**         | Unique identifier for each sales record.                                                        | INT       |
| **ProductID**       | Foreign key linking to the Product table.                                                       | INT       |
| **SalesVolume**     | The quantity of products sold.                                                                  | INT       |
| **ProductPosition** | The position of the product in the catalog or store layout.                                     | NVARCHAR(255) |
| **ScrapedAt**       | The time when the data was scraped (e.g., in web scraping process).                             | DATETIME  |


# Executive Summary

Male customers spend significantly more on promoted products, while female customers show stronger engagement with non-promotional offerings.
End-cap promotions outperform aisle and front-of-store placements, delivering higher visibility and stronger incremental sales.
Jackets lead in popularity, offering potential for higher engagement, while jeans’ premium pricing limits sales growth despite strong demand.
Seasonal demand for sweaters peaks during specific times, while shoes, jeans, and T-shirts sustain steady performance year-round.

![image](https://github.com/user-attachments/assets/4b215c60-b5d5-43e9-bed3-2be1c4994179)

You can find the link to the Tablaue Public interative dashboard here: [Dashboard](https://public.tableau.com/views/final_zara_dashboard/Dashboard1?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)


# Insight DeepDive

1. Men are more inclined towards premium products even during promotions, paying an average of $99.68 compared to women’s $48.37.
2. Women exhibit strategic purchasing behavior, spending less on promotional products ($48.37) but more on non-promotional products ($52.68) than the average of $50.53
3. Promoted products underperform in sales within aisles (-13.14%) and front-of-store (-17.96%) placements compared to non-promoted products.
4. However, end-cap promotions drive success, delivering a +5.3% sales uplift versus non-promoted products.
5. Jackets dominate sales volumes with 259,468 units, while jeans lag significantly at 13,320 units.
6. Despite their lower sales, jeans command a higher average price ($63.92) compared to sweaters ($54.86), which have the lowest average price among categories.
7. Shoes and T-shirts occupy mid-tier sales performance, with median sales of 57,906 and 53,637, priced at $64.87 and $67.43, respectively.
8. Sweaters experience a significant seasonal sales boost, more than doubling with 54,972 units during the season versus 20,270 units in non-seasonal periods.
9. Shoes, jeans, and T-shirts show counter-seasonal sales trends, performing better off-season:
    Shoes: Seasonal sales drop to 18,103, almost half of non-seasonal sales (39,803).
    Jeans: Minimal seasonal demand, with 3,648 units seasonal vs. 9,672 non-seasonal.
    T-shirts: Seasonal sales of 21,137 are significantly lower than non-seasonal sales (32,500).


# Recommendation 

1.Focus premium promotions on male customers who spend more on promoted products. Highlight value-driven deals and optimize non-promotional offerings for women.

2.Reassess promotional strategies for aisle and front-of-store placements; explore alternative approaches to boost visibility and appeal. Prioritize end-cap promotions as a high-performing tactic for driving incremental sales.

3.Leverage the popularity of jackets for upselling or cross-promotional opportunities. Explore pricing strategies to align jeans’ premium pricing with improved sales performance. Optimize marketing for shoes and T-shirts to capitalize on their competitive pricing and steady demand.

4.Maximize sweater promotions during peak seasons to capitalize on demand. Focus on enhancing off-season marketing and promotions for shoes, jeans, and T-shirts to sustain sales momentum year-round.
