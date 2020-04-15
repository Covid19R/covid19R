---
name: Starting to Develop a New Data Package for the Project
about: Help users who want to develop a new data package
title: ''
labels: ''
assignees: ''

---

Welcome to the Covid19R Project! We're so glad you're interested in adding a new data package! We'd love to know what you're about to, so, please, file this issue with a title telling us what data source you're going to be attacking, and fill in the info below! Or - leave some of it blank for now, and ask us questions! We are  game to help out newcomers and seasoned package developers alike. To kick off your package, definitely visit our package template (you don't HAVE to use it, but it might prove helpful and speed up your efforts a great deal!) if only to view the Readme that lays out all of the steps of putting together a data package for the project - https://github.com/Covid19R/covid19_package_template

OK - now, tell us a bit about the data package you're going to write - we've got a template below, but feel free to say more! When you're done with the package, close this issue, and open up an issue for onboarding a completed data package (there's a template for that!)

*Package name:*
*Dataset names:*
*Package github repo:*
*Data source URL:*
*Description of data set(s):*

*Some helpful milestones for you (check 'em off as you go!)*
- [ ] For each dataset, has a `refresh_PKGNAME_*()`function. The _* at the end are for if your package returns multiple datasets.
- [ ] Package has a `get_info_PKGNAME()` function.
- [ ] Datasets meet the tidy data standard laid out in https://github.com/Covid19R/documentation
- [ ] Information returned by `get_info_PKGNAME()` function meets the standards laid out in https://github.com/Covid19R/documentation

*Other things you'd like to tell us (we want to know!):*
