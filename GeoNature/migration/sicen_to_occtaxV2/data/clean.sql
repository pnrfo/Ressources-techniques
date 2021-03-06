ALTER TABLE gn_synthese.synthese DISABLE TRIGGER tri_del_area_synt_maj_corarea_tax;


-- synthese
DELETE FROM gn_synthese.synthese s
USING gn_meta.t_datasets d 
WHERE s.id_dataset = d.id_dataset AND d.dataset_name LIKE CONCAT('%', :'db_oo_name', '%');

-- releves
DELETE FROM pr_occtax.t_releves_occtax r 
USING gn_meta.t_datasets d 
WHERE r.id_dataset = d.id_dataset AND d.dataset_name LIKE CONCAT('%', :'db_oo_name', '%');


-- jdd
DELETE FROM gn_meta.t_datasets WHERE dataset_name LIKE CONCAT('%', :'db_oo_name', '%');
DELETE FROM gn_meta.t_acquisition_frameworks WHERE acquisition_framework_name LIKE CONCAT('%', :'db_oo_name', '%');

-- user
DELETE FROM utilisateurs.t_roles WHERE champs_addi->>'base_origine' LIKE CONCAT('%', :'db_oo_name', '%');

--organismes
DELETE FROM utilisateurs.bib_organismes WHERE url_logo LIKE CONCAT('%', :'db_oo_name', '%');


ALTER TABLE gn_synthese.synthese ENABLE TRIGGER tri_del_area_synt_maj_corarea_tax;
