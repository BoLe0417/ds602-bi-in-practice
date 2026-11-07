# Business Intelligence in Practice

SMU MDSE coursework for *Business Intelligence in Practice: From Dashboard to Action*.

The exercises use SQL (run through DuckDB in Python) on a practice dataset about an AWS sales team, then export results to CSV for Tableau dashboards.

## Contents

| Path | What it is |
|---|---|
| `bi_in_practice.ipynb` | All queries, run in Python with DuckDB |
| `raw_data/` | The 5 practice tables provided by the course (made-up data) |
| `sql/` | Stand-alone SQL for the assignment and Exercise 2 |
| `outputs/` | CSV results used in Tableau |

## Exercises

- **Exercise 1**: Target 1, the number of customers spending $100+/month, actual vs. target by country (Aug 2026).
- **Assignment**: unique customers using at least one Analytics service, by country (Aug 2026), plus the optional comparison with Target 2.
- **Low-hanging fruit**: customers spending $80 to $100 in Aug 2026, with their account manager.

## How to run

```bash
pip install duckdb pandas
```

Open `bi_in_practice.ipynb` from this folder and run the cells in order. The notebook reads the CSVs from `raw_data/`.
