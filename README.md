# Teamwork Project Assignment for the [Database Applications Course @ SoftUni](https://softuni.bg/courses/database-applications/)

This teamwork project assignment is designed to develop skills for working with various database systems (like Oracle, SQL Server and MySQL), to access different data sources and process different data formats (like Excel, PDF, XML and JSON), to import data, process data and export data to different formats.

## Supermarkets Chain – Introduction

A chain of supermarkets has multiple decentralized information systems to hold its data (products, vendors, prices, sales, etc.) and works with different data sources. Data sometimes comes as Excel files or as XML documents or is accessed from a database. The management wants the IT department to produce daily reports in different formats so we need to **develop a set of tools** that do the data importing, processing, exporting and reports generation, following the steps from the figure below:  

![Technologies](https://github.com/adam-p/markdown-here/raw/master/src/common/images/technolgoies.png)

## Problem #1 – Design and Populate the Oracle Database
The chain of supermarkets holds information about its products in Oracle database consisting of at least three tables: products, vendors and measures.
For example, you may have the following tables with sample data (this is just an example):

### Products
 ID | VendorID | Name                 | MeasureID | Price 
--- | -------- | -------------------- | --------- | ----- 
 1  |	20       | Beer “Zagorka”       | 100       |	0.86  
 2  |	30       |	Vodka “Targovishte”	| 100	      | 7.56
 3  |	20       |	Beer “Beck’s”       |	100       |	1.03 
 4  |	10       |	Chocolate “Milka”	  | 200       |	2.80 
... | ...      | ...                  | ...       | ...

### Vendors
 ID | VendorName 
--- | --------------
 10 |	Nestle Sofia Corp.
 20 |	Zagorka Corp.
 30 |	Targovishte Bottling Company Ltd.
... | ... 

### Measures
 ID | Measure Name
--- | ------------
100 |	liters
200 |	pieces
300 |	kg
... | ...

You are free to use the above provided sample database schema and data or design your own DB schema. You may add more columns and new tables or redesign the existing tables. You may use sequential IDs for the primary keys (sequences in Oracle) or any other primary key notation (e.g. [UUID](http://oracle-base.com/articles/9i/uuid-9i.php) unique identifiers).

For testing purposes, please **fill between at least 20 records in each table**. Try to use real-world data.

You may use **any version of Oracle database** (including a cloud-based on-demand solution) and your favorite database management tools, libraries and frameworks. If you do not have experience, the following software and tools are recommended:

* [Oracle Database Express Edition 11g Release 2](http://www.oracle.com/technetwork/database/database-technologies/express-edition/downloads/index.html) – a free version of Oracle DB, running on Linux and Windows
* [Oracle SQL Developer 4.0](http://www.oracle.com/technetwork/developer-tools/sql-developer/downloads/index.html) – a free Java-based database management tool, running on Linux and Windows

**Output**: create a **SQL script** that creates the database schema in the Oracle DB and fills the sample data (20-30 products, vendors, measures and any other data you have designed).

## Problem #2 – Replicate the Tables from Oracle DB and Load Excel Reports from ZIP File into SQL Server
Your task is to write a C# / Java / other application to **replicate the Oracle database tables** to SQL Server database and **load Excel reports into MS SQL Server** database. You should preliminary **design a database schema** in SQL Server to hold all data about the products (data from the Oracle database like products, vendors and measures + data from the Excel files like supermarkets and sales by date) or use **ORM framework and "code-first" approach** to populate the database schema in SQL Server at runtime.
Your app should first **replicate the products data** from Oracle to SQL Server. This should be done on demand, ignoring the products that are already in the SQL Server. Existing products are not changed, but any new products are added in the SQL Server DB on demand.
The **Excel files** are packed inside a ZIP archive holding subfolders named as the **dates of the report** in format **dd-MMM-yyyy** (see the example reports archive [Sample-Sales-Reports.zip](https://github.com/adam-p/markdown-here/raw/master/src/common/sample-sales-report.zip)). Your app should read the ZIP files without unpacking them. Each Excel file holds data similar to the table below:
<table>
  <thead>
    <tr>
      <th colspan="4">Supermarket “Plovdiv – Center”</th>
    </tr>
    <tr>
      <th>Product</th>
      <th>Quantity</th>
      <th>Unit Price</th>
      <th>Sum</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Beer “Beck’s”</td>
      <td>75</td>
      <td>1.05</td>
      <td>78.75</td>
    </tr>
    <tr>
      <td>Beer “Zagorka”</td>
      <td>146</td>
      <td>0.88</td>
      <td>128.48</td>
    </tr>
    <tr>
      <td>Vodka “Targovishte”</td>
      <td>67</td>
      <td>7.7</td>
      <td>515.90</td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <td colspan="3" align="right">Total sum:</td>
      <td><b>723.13</b></td>
    </tr>
  </tfoot>
</table>

Note that the ZIP file could contain few hundred dates (folders), each holding few hundreds Excel files, each holding thousands of data rows, so think about the performance. Use **transactions** to avoid inconsistent data in case of crashing during the load process.

**Input**: Oracle database holding products; ZIP file with Excel 2003 reports (see the example).

**Output**: C# / Java or other application that loads the Excel files into the SQL Server DB.

## Problem #3 – Generate PDF Sales Reports
Create a C# / Java / other program to **generate PDF reports** summarizing the sales information for given period from the SQL Server database.

For example, the **PDF report** may hold a table like the sample below:

<table>
  <tbody>
    <tr>
      <th colspan="5">Aggregated Sales Report</th>
    </tr>
    <tr>
      <td colspan="5">Date: 20-Jul-2014</td>
    </tr>
    <tr>
      <th>Product</th>
      <th>Quantity</th>
      <th>Unit Price</th>
      <th>Location</th>
      <th>Sum</th>
    </tr>
    <tr>
      <td>Beer “Beck’s”</td>
      <td>40 liters</td>
      <td>1.20</td>
      <td>Supermarket “Kaspichan – Center”</td>
      <td>48.00</td>
    </tr>
    <tr>
      <td>Beer “Zagorka”</td>
      <td>37 liters</td>
      <td>1.00</td>
      <td>Supermarket “Bourgas – Plaza”</td>
      <td>37.00</td>
    </tr>
    <tr>
      <td>Chocolate “Milka”</td>
      <td>7 pieces</td>
      <td>2.85</td>
      <td>Supermarket “Bay Ivan” – Zmeyovo</td>
      <td>19.95</td>
    </tr>
    <tr>
      <td>Vodka “Targovishte”</td>
      <td>14 liters</td>
      <td>8.50</td>
      <td>Supermarket “Bourgas – Plaza”</td>
      <td>119.00</td>
    </tr>
    <tr>
      <td>Chocolate “Milka”</td>
      <td>12 pieces</td>
      <td>2.90</td>
      <td>Supermarket “Kaspichan – Center”</td>
      <td>34.80</td>
    </tr>
    <tr>
      <td>Beer “Zagorka”</td>
      <td>65 liters</td>
      <td>0.92</td>
      <td>Supermarket “Kaspichan – Center”</td>
      <td>59.80</td>
    </tr>
    <tr>
      <td>Vodka “Targovishte”</td>
      <td>4 liters</td>
      <td>7.80</td>
      <td>Supermarket “Bay Ivan” – Zmeyovo</td>
      <td>31.20</td>
    </tr>
    <tr>
      <td>…</td>
      <td>…</td>
      <td>…</td>
      <td>…</td>
      <td>…</td>
    </tr>
    <tr>
      <td align="right" colspan="4">Total sum for 20-Jul-2014:</td>
      <td><b>349.75</b></td>
    </tr>
    <tr>
      <td colspan="5">Date: 21-Jul-2014</td>
    </tr>
    <tr>
      <th>Product</th>
      <th>Quantity</th>
      <th>Unit Price</th>
      <th>Location</th>
      <th>Sum</th>
    </tr>
    <tr>
      <td>Beer “Zagorka”</td>
      <td>11 liters</td>
      <td>1.00</td>
      <td>Supermarket “Bourgas – Plaza”</td>
      <td>11.00</td>
    </tr>
    <tr>
      <td>Beer “Zagorka”</td>
      <td>78 liters</td>
      <td>0.92</td>
      <td>Supermarket “Kaspichan – Center”</td>
      <td>71.76</td>
    </tr>
    <tr>
      <td>Beer “Zagorka”</td>
      <td>146 liters</td>
      <td>0.88</td>
      <td>Supermarket “Plovdiv – Stolipinovo”</td>
      <td>128.48</td>
    </tr>
    <tr>
      <td>Vodka “Targovishte”</td>
      <td>20 liters</td>
      <td>8.50</td>
      <td>Supermarket “Bourgas – Plaza”</td>
      <td>170.00</td>
    </tr>
    <tr>
      <td>Vodka “Targovishte”</td>
      <td>67 liters</td>
      <td>7.70</td>
      <td>Supermarket “Plovdiv – Stolipinovo”</td>
      <td>515.90</td>
    </tr>
    <tr>
      <td>Vodka “Targovishte”</td>
      <td>3 liters</td>
      <td>7.80</td>
      <td>Supermarket “Bay Ivan” – Zmeyovo</td>
      <td>23.40</td>
    </tr>
    <tr>
      <td>Beer “Beck’s”</td>
      <td>43 liters</td>
      <td>1.20</td>
      <td>Supermarket “Kaspichan – Center”</td>
      <td>51.60</td>
    </tr>
    <tr>
      <td>Beer “Beck’s”</td>
      <td>75 liters</td>
      <td>1.05</td>
      <td>Supermarket “Plovdiv – Stolipinovo”</td>
      <td>78.75</td>
    </tr>
    <tr>
      <td>Chocolate “Milka”</td>
      <td>9 pieces</td>
      <td>2.90</td>
      <td>Supermarket “Kaspichan – Center”</td>
      <td>26.10</td>
    </tr>
    <tr>
      <td>Chocolate “Milka”</td>
      <td>5 pieces</td>
      <td>2.85</td>
      <td>Supermarket “Bay Ivan” – Zmeyovo</td>
      <td>14.25</td>
    </tr>
    <tr>
      <td>…</td>
      <td>…</td>
      <td>…</td>
      <td>…</td>
      <td>…</td>
    </tr>
    <tr>
      <td colspan="4">Total sum for 21-Jul-2014:</td>
      <td><b>1.24</b></td>
    </tr>
    <tr>
      <td colspan="5">Date: 22-Jul-2014</td>
    </tr>
    <tr>
      <th>Product</th>
      <th>Quantity</th>
      <th>Unit Price</th>
      <th>Location</th>
      <th>Sum</th>
    </tr>
    <tr>
      <td>Beer “Zagorka”</td>
      <td>16.00</td>
      <td>1.00</td>
      <td>Supermarket “Bourgas – Plaza”</td>
      <td>16.00</td>
    </tr>
    <tr>
      <td>Beer “Zagorka”</td>
      <td>90.00</td>
      <td>0.92</td>
      <td>Supermarket “Kaspichan – Center”</td>
      <td>82.80</td>
    </tr>
    <tr>
      <td>Beer “Zagorka”</td>
      <td>230.00</td>
      <td>0.88</td>
      <td>Supermarket “Plovdiv – Stolipinovo”</td>
      <td>202.40</td>
    </tr>
    <tr>
      <td>Vodka “Targovishte”</td>
      <td>24.00</td>
      <td>8.50</td>
      <td>Supermarket “Bourgas – Plaza”</td>
      <td>204.00</td>
    </tr>
    <tr>
      <td>Vodka “Targovishte”</td>
      <td>12.00</td>
      <td>7.70</td>
      <td>Supermarket “Plovdiv – Stolipinovo”</td>
      <td>92.40</td>
    </tr>
    <tr>
      <td>Beer “Beck’s”</td>
      <td>18.00</td>
      <td>1.20</td>
      <td>Supermarket “Kaspichan – Center”</td>
      <td>21.60</td>
    </tr>
    <tr>
      <td>Beer “Beck’s”</td>
      <td>60.00</td>
      <td>1.05</td>
      <td>Supermarket “Plovdiv – Stolipinovo”</td>
      <td>63.00</td>
    </tr>
    <tr>
      <td>Chocolate “Milka”</td>
      <td>14.00</td>
      <td>2.90</td>
      <td>Supermarket “Kaspichan – Center”</td>
      <td>40.60</td>
    </tr>
    <tr>
      <td>…</td>
      <td>…</td>
      <td>…</td>
      <td>…</td>
      <td>…</td>
    </tr>
    <tr>
      <td align="right" colspan="4">Total sum for 22-Jul-2014:</td>
      <td><b>722.80</b></td>
    </tr>
    <tr>
      <td align="right" colspan="4">Grand total:</td>
      <td><b>2163.79</b></td>
    </tr>
  </tbody>
</table>
