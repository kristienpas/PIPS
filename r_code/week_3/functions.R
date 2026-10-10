# Find NAs and duplicates in dataframe
initial_data_check = function(df) {

  # Number of NAs in dataset
  number_NAs = sum(is.na(df))

  # Index of NAs in dataset
  if (number_NAs != 0) {
    index_NAs = which(is.na(df), arr.ind = TRUE)
  } else {
    print("No NAs found!")
    index_NAs = NA
  }

  # Number of duplicated rows
  df_duplicates = df[duplicated(df), ]
  number_duplicates = dim(df_duplicates)[1]

  # Duplicated rows
  if (number_duplicates != 0) {
    index_duplicates = which(
      duplicated(df) | duplicated(df, fromLast = TRUE))
  } else {
    print("No duplicates found!")
    index_duplicates = NA
  }

  # Save results in a list
  results = list(
    NAs = list(number_NAs = number_NAs, index_NAs = index_NAs),
    duplicates = list(
      number_duplicates = number_duplicates,
      index_duplicates = index_duplicates)
  )

  # Return results
  return(results)
}

# Calculate sum/mean across numeric rows/columns
row_col_sum_mean = function(df,
                             rowsum = TRUE,
                             colsum = TRUE,
                             rowmean = TRUE,
                             colmean = TRUE) {

  # Only numeric columns
  numeric_df = df[vapply(df, is.numeric, logical(1))]

  # Check if there are any numeric columns
  if (ncol(numeric_df) == 0) {
    warning("There are no numeric columns.")

    return(list(
      row = list(sum = NA, mean = NA),
      col = list(sum = NA, mean = NA)
    ))
  }

  # Calculate sums and means
  sum_row = if (rowsum) {
    rowSums(numeric_df, na.rm = TRUE)
  } else {
    NA
  }

  sum_col = if (colsum) {
    colSums(numeric_df, na.rm = TRUE)
  } else {
    NA
  }

  mean_row = if (rowmean) {
    rowMeans(numeric_df, na.rm = TRUE)
  } else {
    NA
  }

  mean_col = if (colmean) {
    colMeans(numeric_df, na.rm = TRUE)
  } else {
    NA
  }

  # Save results in a list
  results = list(
    row = list(sum = sum_row, mean = mean_row),
    col = list(sum = sum_col, mean = mean_col)
  )

  # Return results
  return(results)
}
