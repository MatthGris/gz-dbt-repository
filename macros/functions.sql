
{% macro margin_percent(revenue, purchase_cost) %}
    CASE
        WHEN {{ purchase_cost }} = 0 THEN 0  -- to avoid division by zero
        ELSE ROUND(({{ revenue }} - {{ purchase_cost }}) / {{ revenue }} * 100, 2)
    END
{% endmacro %}