SELECT 
    gaiaedr3.gaia_source.ra, 
    gaiaedr3.gaia_source.dec, 
    gaiaedr3.gaia_source.source_id, 
    gaiaedr3.gaia_source.parallax, 
    gaiaedr3.gaia_source.bp_rp, 
    gaiaedr3.gaia_source.phot_g_mean_mag,
    gaiaedr3.gaia_source.dr2_radial_velocity,
    apogeeStar.vhelio_avg,
    apogeeStar.synthvhelio_avg
FROM 
    gaiaedr3.gaia_source
JOIN 
    apogeeStar ON gaiaedr3.gaia_source.source_id = apogeeStar.gaia_source_id
WHERE 
    gaiaedr3.gaia_source.dr2_radial_velocity IS NOT NULL
    AND gaiaedr3.gaia_source.bp_rp IS NOT NULL
    AND gaiaedr3.gaia_source.phot_g_mean_mag IS NOT NULL;
