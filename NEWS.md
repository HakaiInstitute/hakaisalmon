## hakaisalmon 0.2.0

### Data updates
* Included 2017 fish dissections and 2018 field collection data
* Sean Godwin and Lauren Portner contributed sea lice taxonomy data that includes very detailed species, life stages, and sex data. This new table is called `sealice_lab_finescale`.

### Structural updates
* A number of updates were made to sea licing protocol categories, with the addition of *lab_finescale* and others.
* In `zoop_tows`, the *volume* column was renamed to *corrected_volume* to reflect that the volume has been corrected for flowmeter calibrations.
* Most of the inventory information was removed from this package because it becomes out of date so fast. The only remainining inventory information is the `sample_container_inventory`.
* *seine_id* format was changed to be more consistent. Therefore, a small number of seine_ids have changed.

### Functions
* A new function *lump_fraser_sockeye_stocks* was added, which lumps together the sockeye stock ID categories that the Molecular Genetics Lab at the Pacific Biological Station in Nanaimo uses. The stocks are lumped based on regions in the Fraser River Watershed, and are the categories often used by Chrys Neville to summarize juvenile salmon cohorts.

## hakaisalmon 0.1.2

### Data updates

* In `fish_field_data`, updated *analysis_planned* for fish in packages JP49 and JP50 to 'field loused only' due to fish no longer being available for SEMSP laboratory dissections.

### Funtions

* Created the function `log_cumul_abund` for the purposes of measuring migration timing. `log_cumul_abund` takes the cumulative proportion of catch data for each year (make this yourself first) and fits a logistic growth curve to these data and creates predicted values for each day.

## hakaisalmon 0.1.1

### Data updates

* Added new table `survey_activity` that quantifies visual observations of fish-related surface activity for 2017 surveys.
* Updated *dissection_protocol* in `fish_lab_data` from 'lice enumeration only' to 'irregular work-up' for U2256-U2260
* Added UFNs of 2017 fish that were field liced but not retained in `fish_field_data`
* Added new column to `fish_field_data` called *analysis_planned* to denote whether a fish had been field loused only (and not retained for further analysis), were retained for Sam James's UBC diet study, or were retained for standard SEMSP lab analysis
* Updated *dissection_status* of 2015 & 2016-caught sockeye to be current as of 2017-12-08 (completed dissections of of the core site subsamples for 2015/16) in `fish_field_data`
* Added to `package_data`: packages of undissected 2015 non-core PI, CU, CO, and HE that were inventoried in -80 Freezer 1, shelf 2, on 2018-02-05/06 
* Changed 2-character UFNs to have leading '0' before the number, e.g. 'U1' -> 'U01' in in `fish_field_data`, `fish_lab_data`, `stock_id`, and `sealice_lab_motiles` (and in sample ID inventory)
* Updated rows in `stock_id` with proper *sample_id* and *UFN* associations (no change to results)
* Updated `sealice_lab_motiles` with counts for UFNs processed by Lauren Portner in winter 2018
* Assigned missing *ctd_cast_id* to surveys DE340, DE341, and DE329 in `survey_data`
* Re-assignment of genetic stock ID due to PBS 'off by 1' data entry error for the following UFNs:

      --------------------------------------
      U515    U299    U300    U307    U308 
      U317    U318    U319    U328    U331 
      U332    U333    U408    U409    U410 
      U466    U467    U468    U470    U491 
      U492    U482                             
      --------------------------------------

## hakaisalmon 0.1.0

* This was the first version of the data package and did not receive a hakaisalmon R package version number. The dataset, however, can be found at http://dx.doi.org/10.21966/1.566666 or in the commit history of this package.
