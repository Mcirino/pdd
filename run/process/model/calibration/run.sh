#!/usr/bin/env bash
# cmd_extractor  process/model/calibration
# {"dependencies_":["data/model/probabilities","process/model/load_probabilities"],"output_":"model/calibration-plots","style":"cmd_extractor","cmd":"\n            d=../../../model/calibration-plots && mkdir -p \"$d\" && cd \"$d\"\n            # XXX a legacy location under the current run directory for backward compatibility\n            extraOutput=\"${DEEPDIVE_OUTPUT:-../../RUNNING}\"/calibration && mkdir -p \"$extraOutput\"\n            DEEPDIVE_CALIBRATION_NUM_BUCKETS=10\n            \n            # create a view and draw a calibration plot for variable null\n            deepdive db create_calibration_view 'entity_formation' 'label'\n            draw_calibration_plot      'entity_formation' 'label'\n            # XXX keeping a duplicate copy under the current run directory for backward compatibility\n            cp -a 'entity_formation_label'.* \"$extraOutput\"/\n            \n\n            # create a view and draw a calibration plot for variable null\n            deepdive db create_calibration_view 'entity_location' 'label'\n            draw_calibration_plot      'entity_location' 'label'\n            # XXX keeping a duplicate copy under the current run directory for backward compatibility\n            cp -a 'entity_location_label'.* \"$extraOutput\"/\n            \n\n            # create a view and draw a calibration plot for variable null\n            deepdive db create_calibration_view 'entity_taxon' 'label'\n            draw_calibration_plot      'entity_taxon' 'label'\n            # XXX keeping a duplicate copy under the current run directory for backward compatibility\n            cp -a 'entity_taxon_label'.* \"$extraOutput\"/\n            \n\n            # create a view and draw a calibration plot for variable null\n            deepdive db create_calibration_view 'entity_temporal' 'label'\n            draw_calibration_plot      'entity_temporal' 'label'\n            # XXX keeping a duplicate copy under the current run directory for backward compatibility\n            cp -a 'entity_temporal_label'.* \"$extraOutput\"/\n            \n\n            # create a view and draw a calibration plot for variable null\n            deepdive db create_calibration_view 'relation_formation' 'label'\n            draw_calibration_plot      'relation_formation' 'label'\n            # XXX keeping a duplicate copy under the current run directory for backward compatibility\n            cp -a 'relation_formation_label'.* \"$extraOutput\"/\n            \n\n            # create a view and draw a calibration plot for variable null\n            deepdive db create_calibration_view 'relation_formation_global' 'label'\n            draw_calibration_plot      'relation_formation_global' 'label'\n            # XXX keeping a duplicate copy under the current run directory for backward compatibility\n            cp -a 'relation_formation_global_label'.* \"$extraOutput\"/\n            \n\n            # create a view and draw a calibration plot for variable null\n            deepdive db create_calibration_view 'relation_formationtemporal' 'label'\n            draw_calibration_plot      'relation_formationtemporal' 'label'\n            # XXX keeping a duplicate copy under the current run directory for backward compatibility\n            cp -a 'relation_formationtemporal_label'.* \"$extraOutput\"/\n            \n\n            # create a view and draw a calibration plot for variable null\n            deepdive db create_calibration_view 'relation_formationtemporal_global' 'label'\n            draw_calibration_plot      'relation_formationtemporal_global' 'label'\n            # XXX keeping a duplicate copy under the current run directory for backward compatibility\n            cp -a 'relation_formationtemporal_global_label'.* \"$extraOutput\"/\n            \n\n            # create a view and draw a calibration plot for variable null\n            deepdive db create_calibration_view 'relation_taxonomy' 'label'\n            draw_calibration_plot      'relation_taxonomy' 'label'\n            # XXX keeping a duplicate copy under the current run directory for backward compatibility\n            cp -a 'relation_taxonomy_label'.* \"$extraOutput\"/\n            \n\n            # create a view and draw a calibration plot for variable null\n            deepdive db create_calibration_view 'relation_taxonomy_global' 'label'\n            draw_calibration_plot      'relation_taxonomy_global' 'label'\n            # XXX keeping a duplicate copy under the current run directory for backward compatibility\n            cp -a 'relation_taxonomy_global_label'.* \"$extraOutput\"/\n            \n        ","name":"process/model/calibration"}
set -xeuo pipefail
cd "$(dirname "$0")"



export DEEPDIVE_CURRENT_PROCESS_NAME='process/model/calibration'

            d=../../../model/calibration-plots && mkdir -p "$d" && cd "$d"
            # XXX a legacy location under the current run directory for backward compatibility
            extraOutput="${DEEPDIVE_OUTPUT:-../../RUNNING}"/calibration && mkdir -p "$extraOutput"
            DEEPDIVE_CALIBRATION_NUM_BUCKETS=10
            
            # create a view and draw a calibration plot for variable null
            deepdive db create_calibration_view 'entity_formation' 'label'
            draw_calibration_plot      'entity_formation' 'label'
            # XXX keeping a duplicate copy under the current run directory for backward compatibility
            cp -a 'entity_formation_label'.* "$extraOutput"/
            

            # create a view and draw a calibration plot for variable null
            deepdive db create_calibration_view 'entity_location' 'label'
            draw_calibration_plot      'entity_location' 'label'
            # XXX keeping a duplicate copy under the current run directory for backward compatibility
            cp -a 'entity_location_label'.* "$extraOutput"/
            

            # create a view and draw a calibration plot for variable null
            deepdive db create_calibration_view 'entity_taxon' 'label'
            draw_calibration_plot      'entity_taxon' 'label'
            # XXX keeping a duplicate copy under the current run directory for backward compatibility
            cp -a 'entity_taxon_label'.* "$extraOutput"/
            

            # create a view and draw a calibration plot for variable null
            deepdive db create_calibration_view 'entity_temporal' 'label'
            draw_calibration_plot      'entity_temporal' 'label'
            # XXX keeping a duplicate copy under the current run directory for backward compatibility
            cp -a 'entity_temporal_label'.* "$extraOutput"/
            

            # create a view and draw a calibration plot for variable null
            deepdive db create_calibration_view 'relation_formation' 'label'
            draw_calibration_plot      'relation_formation' 'label'
            # XXX keeping a duplicate copy under the current run directory for backward compatibility
            cp -a 'relation_formation_label'.* "$extraOutput"/
            

            # create a view and draw a calibration plot for variable null
            deepdive db create_calibration_view 'relation_formation_global' 'label'
            draw_calibration_plot      'relation_formation_global' 'label'
            # XXX keeping a duplicate copy under the current run directory for backward compatibility
            cp -a 'relation_formation_global_label'.* "$extraOutput"/
            

            # create a view and draw a calibration plot for variable null
            deepdive db create_calibration_view 'relation_formationtemporal' 'label'
            draw_calibration_plot      'relation_formationtemporal' 'label'
            # XXX keeping a duplicate copy under the current run directory for backward compatibility
            cp -a 'relation_formationtemporal_label'.* "$extraOutput"/
            

            # create a view and draw a calibration plot for variable null
            deepdive db create_calibration_view 'relation_formationtemporal_global' 'label'
            draw_calibration_plot      'relation_formationtemporal_global' 'label'
            # XXX keeping a duplicate copy under the current run directory for backward compatibility
            cp -a 'relation_formationtemporal_global_label'.* "$extraOutput"/
            

            # create a view and draw a calibration plot for variable null
            deepdive db create_calibration_view 'relation_taxonomy' 'label'
            draw_calibration_plot      'relation_taxonomy' 'label'
            # XXX keeping a duplicate copy under the current run directory for backward compatibility
            cp -a 'relation_taxonomy_label'.* "$extraOutput"/
            

            # create a view and draw a calibration plot for variable null
            deepdive db create_calibration_view 'relation_taxonomy_global' 'label'
            draw_calibration_plot      'relation_taxonomy_global' 'label'
            # XXX keeping a duplicate copy under the current run directory for backward compatibility
            cp -a 'relation_taxonomy_global_label'.* "$extraOutput"/
            
        



