#!/bin/bash
CWD=$(pwd);
timelineCss=$CWD'/vendor/assets/stylesheets/timelineJS/timeline.css.erb';
darkCss=$CWD'/vendor/assets/stylesheets/timelineJS/themes/dark.css.erb';

s1='url\([';
s2="'\"]?(?!data:)([^\)";
s3="'\"]+)['\"]?\)";
r=$s1$s2$s3;

echo $r;

exp='s/'$r'/url(<%= image_path("timelineJS\/$1") %>)/g';

perl -pi -e "$exp" $timelineCss;
perl -pi -e "$exp" $darkCss;

