checkpoint 5

These are some of the guidelines for running the code in checkpoint - 5:

1. Run the queries sequentially in the SQL file present in the src folder. If you are using the DataGrip tool,
you can extract the data as csv files. One can extract 2 csv files, one where officers were disciplined (data_cp5_disciplined.csv)
and another scenario where the officers weren't disciplined (data_cp5_not_disciplined.csv). 

2. The notebook "CP5_civilian_vs_police_complaint_disciplined" deals with the topic modeling of complaint reports filed by 
civilian and police which led to the accused officer being disciplined. The code in the notebook is pretty straight forward. 
One just has to execute the cells in the right order. But ensure that when you are reading the csv file, the file path is in
sync with your local path. We have saved the LDA models, the models are available in the /data/topic_models folder. There are
code snippets in the notebook that showcase how to load a saved model. But ensure that when you are trying to load the models, 
the file path is in sync with your local path. We have also provided the html files for visualizing the topic modeling results 
via the pyLDAVis package. The visualizations are interactive and the html files can be found in the /data/interactive_visualization_lda 
folder.

3. The notebook "CP5_Keywords" deals with extracting the keywords from complaint reports filed by civilian and police which led 
to the accused officer being disciplined. The code in the notebook is pretty straight forward. One just has to execute the cells 
in the right order. But ensure that when you are reading the csv file, the file path is in sync with your local path.

4. In the notebook "CP5", we were trying to explore some other areas relevant to our theme and experimenting with different topic models. 
This notebook primarily deals with the topic modeling of complaint reports where the officers were disciplined and were not disciplined.
We wanted to study the difference in the scenario of disciplined vs not-disciplined. Our objective was also to experiment with 
different topic modeling techniques such as Hierarchical Dirichlet Process (HDP), Latent Semantic Indexing (LSI) and Latent Dirichlet Allocation (LDA).
The code in the notebook is pretty straight forward. One just has to execute the cells in the right order. But ensure that when you are reading the csv 
file, the file path is in sync with your local path. We have saved the various topic models, the models are available in the /data/topic_models folder. 
There are code snippets in the notebook that showcase how to load a saved model. But ensure that when you are trying to load the models, 
the file path is in sync with your local path. 
