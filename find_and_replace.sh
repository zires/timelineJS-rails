#!/bin/bash
CWD=$(pwd);
timelineCss=$CWD'/vendor/assets/timelineJS/css/timeline.css.erb';
darkCss=$CWD'/vendor/assets/timelineJS/css/themes/dark.css.erb';

s1='url\([';
s2="'\"]?(?!data:)([^\)";
s3="'\"]+)['\"]?\)";
r=$s1$s2$s3;

echo $r;

exp='s/'$r'/url(<%= image_path("images\/$1") %>)/g';

perl -pi -e "$exp" $timelineCss;
perl -pi -e "$exp" $darkCss;

