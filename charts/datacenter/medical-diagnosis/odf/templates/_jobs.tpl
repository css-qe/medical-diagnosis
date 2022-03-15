{{- define "odf.jobs" -}}
AWS_ACCESS_KEY_ID=$(oc extract -n openshift-storage secret/rook-ceph-object-user-ocs-storagecluster-cephobjectstore-xraylab-1 --keys=AccessKey --to=-)
AWS_SECRET_ACCESS_KEY=$(oc extract -n openshift-storage secret/rook-ceph-object-user-ocs-storagecluster-cephobjectstore-xraylab-1 --keys=SecretKey --to=-)
oc create secret generic s3-secret-bck --from-literal=AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} --from-literal=AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} -n {{ .Values.global.xraylab.namespace }}
{{- end -}}
