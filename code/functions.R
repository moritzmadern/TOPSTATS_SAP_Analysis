## Functions and auxilliary variables




##### Function to summarize a dataframe - especially character columns #####
summary_df <- function(df){
  
  # go over each column and aggregate relevant information
  list_res <- lapply(names(df), FUN=function(nm){
    x <- df[[nm]]
    data.frame(colname = nm,
               class = class(x),
               number_NA = sum(is.na(x)),
               emptyChar = if(class(x)=="character") sum(x=="") else 0)
  })
  
  # rbind information of each column
  return(do.call("rbind",args=list_res))
}



##### Function to convert list of ATC values per unique pooled hospitalizations into dataframe
list_to_logical_df <- function(l_inhibitors, v_ATC) {
  
  # initiate output dataframe
  df <- data.frame(
    id_indexHosp = names(l_inhibitors),
    stringsAsFactors = FALSE
  )
  
  # loop over each code in v_ATC and save which list elements contained matching character vector entries
  for (a in v_ATC) {
    df[[a]] <- vapply(    # Comment-AI: AI helped me code this function
      l_inhibitors,
      function(x) a %in% x,
      logical(1)
    )
  }
  
  # return df
  return(df)
}



##### Define ICD codes of relevant comorbidities #####
v_ICD_com = strsplit(
  "I440, I441, I442, I49, I490, I491, I492, I493, I494, I495, I498, I499, I470, I471, I479,
  I48, I480, I481, I482, I483, I484, I489,
  C00, C01, C02, C03, C04, C05, C06, C07, C08, C09, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24, C25, C26, C30, C31, C32, C33, C34, C35, C36, C37, C38, C39, C40, C41, C43, C44, C45, C46, C47, C48, C49, C50, C51, C52, C53, C54, C55, C56, C57, C58, C60, C61, C62, C63, C64, C65, C66, C67, C68, C69, C70, C71, C72, C73, C74, C75,
  I50, I500, I5000, I5001, I5002, I5003, I5004, I5005, I501, I5011, I5012, I5013, I5014, I5019, I509, I42, I420, I421, I422, I423, I424, I425, I426, I427, I428, I4280, I4288, I429,
  I220, I221, I228, I229, I240, I241, I252, I2520, I2521, I2522, I2529, I253, I254, I255, I256, I258, I259, I200, I201, I208, I209, I21, I210, I211, I212, I213, I214, I219, I248, I249, I250, I251, I2510, I2511, I2512, I2513, I2514, I2515, I2516, I2519,
  E100, E1001, E101, E1011, E102, E1020, E1021, E103, E1030, E1031, E104, E1040, E1041, E105, E1050, E1051, E106, E1060, E1061, E107, E1072, E1073, E1074, E1075, E108, E1080, E1081, E109, E1090, E1091, E110, E1101, E111, E1111, E112, E1120, E1121, E113, E1130, E1131, E114, E1140, E1141, E115, E1150, E1151, E116, E1160, E1161, E117, E1172, E1173, E1174, E1175, E118, E1180, E1181, E119, E1190, E1191, E120, E1201, E121, E1211, E122, E1220, E1221, E123, E1230, E1231, E124, E1240, E1241, E125, E1250, E1251, E126, E1260, E1261, E127, E1272, E1273, E1274, E1275, E128, E1280, E1281, E129, E1290, E1291, E130, E1301, E131, E1311, E132, E1320, E1321, E133, E1330, E1331, E134, E1340, E1341, E135, E1350, E1351, E136, E1360, E1361, E137, E1372, E1373, E1374, E1375, E138, E1380, E1381, E139, E1390, E1391, E140, E1401, E141, E1411, E142, E143, E1430, E144, E1441, E1450, E1451, E1461, E147, E1472, E1475, E148, E1481, E1490, E1491, R730, R739,
  I61, I610, I611, I612, I613, I614, I615, I616, I618, I619,
  E78, E781, E782, E783, E784, E785, E786, E788, E789,
  I1000, I1001, I101, I1010, I1011, I109, I1090, I1091, I110, I1101, I119, I1190, I1191,
  B20, B21, B22, B23, B24,
  D90,
  Z940, Z941, Z942, Z943, Z944, Z946, Z9481, Z9488, Z949,
  G45, G450, G451, G452, G453, G454, G458, G459, G468, I63, I630, I631, I632, I633, I634, I635, I636, I638, I639,
  N17, N170, N171, N172, N178, N179, N181, N182, N183, N184, N185, N188, N1889, N189, N19,
  K70, K71, K72, K73, K74, K75, K76, K77,
  E6606, E6607, E6608, E6616, E6617, E6618, E6626, E6627, E6628, E6686, E6687, E6688, E6696, E6697, E6698,
  I7020, I7021, I7022, I7023, I7024, I7025, I7026, I7029, I708, I709,
  J440, J4400, J4401, J4402, J4403, J4409, J441, J4410, J4411, J4412, J4413, J4419, J448, J4480, J4481, J4482, J4483, J4489, J449, J4490, J4491, J4492, J4493, J4499, J450, J451, J458, J459, I270, I2720, I2728, E84,
  I26, I260, I269" ,split = ",")[[1]] %>% trimws()



##### Define ATC groups
l_atc_groups <- list(
  A10A = "A10A",
  A10B = "A10B",
  B01  = "B01",
  R01  = "R01",
  R03  = "R03",
  C01  = "C01",
  C02  = "C02",
  C03  = "C03",
  C07  = "C07",
  C08  = "C08",
  C09  = "C09",
  C10  = "C10"
)



