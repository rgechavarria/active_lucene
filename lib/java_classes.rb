Dir[File.expand_path(File.dirname(__FILE__) + "/*.jar")].each do |path| 
  require path.split('/').last.gsub('.jar', '')
end

java_import org.apache.lucene.document.Field

java_import org.apache.lucene.store.FSDirectory

java_import org.apache.lucene.index.IndexReader
java_import org.apache.lucene.index.IndexWriter

java_import org.apache.lucene.analysis.standard.StandardAnalyzer

java_import org.apache.lucene.queryParser.standard.StandardQueryParser

java_import org.apache.lucene.search.IndexSearcher
java_import org.apache.lucene.search.BooleanClause
java_import org.apache.lucene.search.BooleanQuery
java_import org.apache.lucene.search.MatchAllDocsQuery
java_import org.apache.lucene.search.WildcardQuery

java_import org.apache.lucene.search.spell.LuceneDictionary;
java_import org.apache.lucene.search.spell.SpellChecker;

java_import org.apache.lucene.search.highlight.QueryScorer
java_import org.apache.lucene.search.highlight.Highlighter

java_import org.apache.lucene.util.Version