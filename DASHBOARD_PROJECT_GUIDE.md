# MATH 421 dashboard project

Questions 1 and 2 are static dashboards. Questions 3 through 10 are live
Shiny dashboards. Question 11 contains the class presentation.

## Open in RStudio

Open the QMD inside the folder for that question. Click **Render** for
Questions 1, 2, and 11. Click **Run Document** for Questions 3 through 10.
The code is in each QMD with named chunks and comments. Keep each bundled
CSV and the `www` folder beside its QMD.

| Question | Topic | Required input |
| --- | --- | --- |
| 1 | Empty layout | Static |
| 2 | Titanic exploration | Static |
| 3 | Titanic grouping | Dropdown |
| 4 | Adult Census | Dropdown |
| 5 | Adult Census | Checkboxes |
| 6 | Adult Census | Sliders |
| 7 | Adult Census | Radio buttons |
| 8 | New England COVID reporting | Date range |
| 9 | New England COVID reporting | Four input types together |
| 10 | Car Fuel Economy | Dropdown, checkboxes, slider, radio buttons, numeric input |
| 11 | Car Fuel Economy presentation | Ten slides |

## Question 10 data

The prepared CSV has 12,381 single-fuel gasoline and diesel configurations
from 2015 through 2025, including non-plug-in hybrids. It is a subset of
the official FuelEconomy.gov CSV downloaded November 18, 2026. The
`prepare_data.R` script documents the selection and can refresh it.
You do not need to run it to launch the bundled dashboard.

The default results are 23.3 mean combined MPG and a mean highway-minus-city
gap of 6.7 MPG. Cars have a median combined MPG of 24 and pickups 19.
These are configuration averages, not sales-weighted fleet estimates.

## Publish

Questions 3-10 are published on Posit Connect Cloud. Their live URLs are
listed in the project section of README.md. A rendered HTML file alone cannot run
the Shiny controls. Do not use those generated HTML files as app links.

Each free Posit Connect Cloud account allows five apps. Questions 3-6 use
`dmontoyavalencia`; Questions 7-10 use `danimontoyav`. Both accounts are
registered with rsconnect on this computer. No paid upgrade was used.

For an older RStudio, open `PUBLISH_DASHBOARD.R` from the course folder.
Change the question number and account name, then run the script. Approve
the official Posit authorization when prompted. It publishes one app at a
time and opens its page. Copy the final public app URL for your README.

Alternatively, commit the QMD, CSV, `www` folder, and `manifest.json` to
your public GitHub repository, connect GitHub to Posit Connect Cloud,
and publish the QMD from that repository. Regenerate the manifest after
changing source files or packages; the helper script does that for you.

The Question 10 source-code button points to the raw QMD in
`dashboard_q10/dashboard_q10.qmd` in the main branch of your public
`math421assigments` repository. That button starts working after you push
that file to GitHub.

## README text for the static files

```markdown
[Dashboard Project - Question 1](dashboard_q1/dashboard_q1.html)

[Dashboard Project - Question 2](dashboard_q2/dashboard_q2.html)

[Dashboard Project - Presentation](dashboard_q11/dashboard_q11.html)
```

Once the apps are published, add one link for each Question 3-10 using the
actual app URLs, such as `[Dashboard Project - Question 3](PASTE_APP_URL_HERE)`.
Replace the placeholder before saving it. Submit your GitHub page link to
Canvas as the assignment directs.

The slide deck is also available as `Fuel_Economy_Presentation.pptx` in
`dashboard_q11`. The Quarto HTML slides are suitable for a website link.
