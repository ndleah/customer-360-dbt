-- Test the age_in_years macro
{% set test_date = '1990-01-01' %}

with 

-- create mock data
input_data as (

select 33 as input_date

)

select
    input_date,
    {{ age_in_years("'1990-01-01'") }} as age_in_years

from input_data

where input_date != {{ age_in_years("'1990-01-01'") }}
