![Star Badge](https://img.shields.io/static/v1?label=%F0%9F%8C%9F&message=If%20Useful&style=style=flat&color=BC4E99)
![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg?v=103)
# Customer 360 <img src="https://seeklogo.com/images/D/dbt-logo-500AB0BAA7-seeklogo.com.png" align="right" width="120" />

> * **Author:** [Leah Nguyen](https://www.linkedin.com/in/ndleah/)
> * This repository consists of a [dbt](https://www.getdbt.com/) project that transforms raw data sources into clear, formatted models for the customer360 data.

### Pre-requisites

The project assumes these tools are available:

+ Makefile
+ Python 3.9+ ([python.org](https://www.python.org/downloads/), [Anaconda](https://www.anaconda.com/download), [pyenv](https://github.com/pyenv/pyenv) etc)
+ Docker, Docker Compose (https://www.docker.com/products/docker-desktop/)

You'd likely need a Postgres client to see what models look like. Here's [one](https://dbeaver.io/).

### Development

The `integration_tests` directory is set up to work through this exercise, including:
+ starting a Postgres container and seeding it with fake data
+ running models and tests included in the parent package (see [packages.yml](./integration_tests/packages.yml), [profiles.yml](./integration_tests/profiles.yml))
+ tear down
+ a `Makefile` for running the above tasks (try `make help`)

---

Follow these steps (assumes you are in `integration_tests` directory):

1. Set up Python virtual environment and install dependencies (including DBT + Postgres adaptor):
```sh
$> python -m venv venv
$> source venv/bin/activate
$> pip install -r requirements.txt
```

2. Start database and populate with sample datasets: 
```sh
$> make setup
```

3. Run and test models using DBT
```sh
$> make models
```

4. Tear down (will destroy the DB container)
```sh
$> make teardown
```


## ⚙️ Usage
To document my approaches to the assessment, I have created a series of GitHub issues accompanied by corresponding pull requests. Each issue contains a summary of my approach as a comment at the end of the page. For your convenience, I have provided the links to all the issues below.

By accessing these links, you can review the details of my approaches and gain a deeper understanding of the assessment process. When in doubt, please review a list of all issues related to this assessment [here](https://github.com/ndleah/customer-360-dbt/issues?q=is%3Aissue+is%3Aclosed). Feel free to refer to these resources for further reference and clarification.

## 🚧 Data Infrastructure

I made some significant changes to the dbt project infrastructure by implementing Kimball data modelling. For more details, please further review it [here](https://github.com/ndleah/customer-360-dbt/issues/10).

The final dbt project structure will look something as this:
```
customer360
├── README.md
├── analyses
├── dbt_project.yml
├── macros                                    <- dbt macros
│   ├── age_in_years.sql
│   ├── as_utc_timestamp.sql
├── sensitive                                 <<- macro for implement PII data masking
│   └── ...sql
├── seeds                                     <- seed models
│   └── seed_missing_contacts.csv
├── models                                    <- transformation models
│   ├── intermediate                          <<- intermediate layer - perform data cleaning & complex joins
│   │   └── int_deduped_contacts.sql
│   ├── marts
│   │   ├── core                              <<- core layer - fact and dimension tables
│   │   │   ├── ...yml
│   │   │   └── ...sql
│   │   └── marketing                         <<- reporting layer - reporting ready models
│   │       ├── _marketing__models.yml
│   │       └── customers.sql
│   ├── staging                               <<- staging layer - replica 1:1 with the source
├── snapshots
└── tests
    └── macros                                <<- tests for macro go here!
```

## 📌 Assignment

### 1. Fix the failing tests

[1. Fix failed test with category acceptance values](https://github.com/ndleah/dbt-hipages/issues/2)

[2. Fix duplicate values on contact_id](https://github.com/ndleah/dbt-hipages/issues/3)

### 2. Add a test to validate the referential integrity of the transactions table

[1. Add test to validate the transactions referential integrity](https://github.com/ndleah/dbt-hipages/issues/4)

[2. Fix missing contact_id in dim_contacts](https://github.com/ndleah/dbt-hipages/issues/25)

### Ensuring transactions data is not older than 1 day and when to run these checks

[Source Freshness Test](https://github.com/ndleah/dbt-hipages/issues/5)

### Adding tests for macros

[Add tests for macros](https://github.com/ndleah/dbt-hipages/issues/6)

### Refactoring macros for compatibility with Databricks and Postgres

[Allow switching between Postgres and Databricks syntax ](https://github.com/ndleah/dbt-hipages/issues/15)

### Enhancements to the customers model and validation tests

[1. Add new features to marketing_customers table](https://github.com/ndleah/dbt-hipages/issues/8)

[2. Add test for new transformation logic on marketing_customers](https://github.com/ndleah/dbt-hipages/issues/12)

### Product Category Recommender: Next Best Product Category implementation
[Product Category Recommender](https://github.com/ndleah/dbt-hipages/issues/9)

### Data Sharing: Implementation of PII 

[Implement PII on sensitive columns](https://github.com/ndleah/dbt-hipages/issues/7)

### Others
[Implement Kimball modelling](https://github.com/ndleah/dbt-hipages/issues/10)

[Improve dbt_project.yml config](https://github.com/ndleah/dbt-hipages/issues/21)

[Performance tuning](https://github.com/ndleah/dbt-hipages/pull/27)


## 📝 Feedback

If you have any feedback or ideas to improve this project, feel free to contact me via my email at nduongthucanh@gmail.com or:

<a href="https://www.linkedin.com/in/ndleah/">
  <img align="left" alt="Leah's LinkdedIn" width="22px" src="https://cdn.jsdelivr.net/npm/simple-icons@v3/icons/linkedin.svg" />

</a>
<a href="https://github.com/ndleah">
  <img align="left" alt="Leah's Github" width="22px" src="https://cdn.jsdelivr.net/npm/simple-icons@v3/icons/github.svg" />
</a>

___________________________________

<p>&copy; 2023 Leah Nguyen</p>

