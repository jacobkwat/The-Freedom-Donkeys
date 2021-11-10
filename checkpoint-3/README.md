# The Freedom Donkeys Checkpoint 3

### Question 1: Number of officer/civilian allegation reports in each category

[Civilian Complaints Bar Chart Race](https://observablehq.com/@jacobkwat/civilian_complaints_barchartrace)

[Officer Complaints Bar Chart Race](https://observablehq.com/@jacobkwat/police_complaints_barchartrace)

These visualizations observe the number of complaints in each category from 2000-2017. We split it into two 
to illustrate the difference between civilian and officer complaints. There is a 'replay' button that will play
the visualization again after its ended.

### Question 2: Number of officers disciplined together

[Zoomable Circle Packing](https://observablehq.com/@bodhisattamaiti/zoomable_circle_packing_officers_disciplined)


This visualization has a 3 layered zoom in/out property. The first layer showcases the decades.
For example, 1981-90, 1991-00, etc. When an user clicks on one of the decade circle, they can
see the different crids (circles) associated with that decade, this is the second layer. When an user
clicks on a particular crid circle, they can see the officers associated with the crid who were disciplined together (circles).
In these circles, we have the different attributes of the police officers such as name, gender, race, rank, 
allegation count (AC), discipline count (DC) and honorable mention count (HMC). This helps us in understanding
the different dynamics of the police officers who were disciplined together. One can click on the external 
circles to zoom out. 

For interactivity, we have a select dropdown and a slider. The size of the circles are dependent
on the count value that one chooses in the select dropdown. We are providing the users with 3 types of counts 
associated with a police officer: allegation count, discipline count and honorable mention count. 
The slider helps us in selecting the minimum number of officers that were disciplined together in a crid. 
The values range from 2 to 108 in the slider.

