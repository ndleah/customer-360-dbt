-- Test the 'as_timestamp_utc' macro
-- Define test inputs
{% set input_timestamp = "'2022-06-30 11:30:00'" %}
{% set expected_converted_timestamp = "'2022-06-30 21:30:00'" %}


with mock_data as (
    
    select
        timestamp {{ expected_converted_timestamp }} as expected_converted_timestamp,
        {{ input_timestamp }} as input_timestamp
        
),

tz_conversions as (

    select
        expected_converted_timestamp,
        {{ as_timestamp_utc(input_timestamp) }} AS converted_timestamp
    
    from mock_data

)

select * from tz_conversions

where expected_converted_timestamp::date != converted_timestamp::date
