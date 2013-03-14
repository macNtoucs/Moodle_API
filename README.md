Moodle_API
==========

## 登入界面
   參數為學號以及登入moodle的密碼
   回傳一個Dictionary
   EX: {“result”=”1”,”token”=”token”}
   token是一個登入識別碼
 
+(NSDictionary *)Login:(NSString *)username andPassword:(NSString*)password;



##依照學生學號與學年度回傳選課課表
  參數為登入後的識別碼token
  回傳一個Dictionary

 +(NSDictionary *)GetCourse_AndUseToken:(NSString*)token;

##回傳課程資訊
 參數: token:識別碼
      cosid:課程課號
      clsid:開課班號(班別)
 
+(NSDictionary *)GetCourseInfo_AndUseToken:(NSString *)token
                                  courseID:(NSString *)cosID
                                   classID:(NSString *)clsID;




## 回傳moodle最新消息
 參數: token:識別碼
 cosid:課程課號
 clsid:開課班號(班別)
  
+(NSDictionary *)GetMoodleInfo_AndUseToken:(NSString *)token
                                  courseID:(NSString *)cosID
                                   classID:(NSString *)clsID;


##依照學生學號與課號，回傳該生在moodle上作業成績等
 參數: token:識別碼
 cosid:課程課號
 clsid:開課班號(班別)
  
+(NSDictionary *)GetGrade_AndUseToken:(NSString *)token
                                  courseID:(NSString *)cosID
                                   classID:(NSString *)clsID;



##依照課號等資訊，回傳moodle上實際使用之id
 EX: 作業系統的實際課程課號是B5703660，但其實moodle都有一個id來使用，作業系統在moodle上的id就是19391
     
 參數: token:識別碼
 cosid:課程課號
 clsid:開課班號(班別)
 
 

+(NSDictionary *)GetMoodleID_AndUseToken:(NSString *)token
                                courseID:(NSString *)cosID
                                 classID:(NSString *)clsID;


##依照課號，班別，資源形態回傳公告詳細內容
 參數: token:識別碼
 cosid:課程課號
 clsid:開課班號(班別)
 moodleID:(moodle上實際使用之id，可由GetMoodleID此API取得)
 module:資源 (來自GetMoodleInfo此API的其中一個回傳值)
 
+(NSDictionary *)MoodleID_AndUseToken:(NSString *)token
                               module:(NSString *)module
                             moodleID:(NSString *)mid
                             courseID:(NSString *)cosID
                              classID:(NSString *)clsID;



##取得檔案夾內容
 參數: dir  	(/moodle課號/[考古題 課程講義 作業] 三者其中之一)
 ex: getFilesFolder_InDir:@"/19367/考古題"
 
+(NSArray *)getFilesFolder_InDir:(NSString *)dir;



##下載檔案並回傳檔案路徑
 參數: dir		(/moodle課號/考古題 課程講義 作業 三者其中之一)
    FileName (檔案名稱，由getFilesFolder_InDir所提供的array得到)
 
 debugMSG: 若回傳Error_dir_or_FileName則表示參數有誤
 
 ex: GetPathOfDownloadFiles_fileName:@"_10_JavaScript_for_Ajax_-_example.rar" 
                             FromDir:@"/19367/課程講義"

+(NSString * ) GetPathOfDownloadFiles_fileName:(NSString *)FileName
                                       FromDir:(NSString *)dir;


##刪除所有下載的檔案
 正常刪除將回傳true
 
+(BOOL)CleanUpAllTheFiles;
