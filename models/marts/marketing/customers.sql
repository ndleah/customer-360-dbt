SELECT
    id,
    gender,
    {{ age_in_years('birth_date') }} AS age,
    sum(amount) as total_expense
FROM {{ ref('contacts_joined_with_transactions') }}
GROUP BY
    1,2,3