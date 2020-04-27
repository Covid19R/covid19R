---
name: Onboard a new completed data package
about: Fill out this form to have your data form that returns tidy covid-19 data added
  to covid19R
title: ''
labels: onboarding new data package
assignees: ''

---

This issue template is for those of you adding a new data source. Please make sure your package accords to the guidelines set out in https://github.com/Covid19R/documentation. Below, we include a template for us to quickly make sure you are ready to be added. 

Package name:
Dataset names:
Package github repo:
Data source URL:
License of Data:
URL for Full information about Data Source:
Do you want this package to be moved to the covid19R organization:
Additional data columns returned beyond the tidy data standard specified in https://github.com/Covid19R/documentation

- [ ] For each dataset, has a `refresh_PKGNAME_*()`function. The _* at the end are for if your package returns multiple datasets.
- [ ] Package has a `get_info_PKGNAME()` function.
- [ ] Datasets meet the tidy data standard laid out in https://github.com/Covid19R/documentation
- [ ] Information returned by `get_info_PKGNAME()` function meets the standards laid out in https://github.com/Covid19R/documentation

Description of data:
