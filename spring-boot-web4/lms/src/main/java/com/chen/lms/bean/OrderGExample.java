package com.chen.lms.bean;

import java.util.ArrayList;
import java.util.List;

public class OrderGExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public OrderGExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andOrdIdIsNull() {
            addCriterion("ord_id is null");
            return (Criteria) this;
        }

        public Criteria andOrdIdIsNotNull() {
            addCriterion("ord_id is not null");
            return (Criteria) this;
        }

        public Criteria andOrdIdEqualTo(String value) {
            addCriterion("ord_id =", value, "ordId");
            return (Criteria) this;
        }

        public Criteria andOrdIdNotEqualTo(String value) {
            addCriterion("ord_id <>", value, "ordId");
            return (Criteria) this;
        }

        public Criteria andOrdIdGreaterThan(String value) {
            addCriterion("ord_id >", value, "ordId");
            return (Criteria) this;
        }

        public Criteria andOrdIdGreaterThanOrEqualTo(String value) {
            addCriterion("ord_id >=", value, "ordId");
            return (Criteria) this;
        }

        public Criteria andOrdIdLessThan(String value) {
            addCriterion("ord_id <", value, "ordId");
            return (Criteria) this;
        }

        public Criteria andOrdIdLessThanOrEqualTo(String value) {
            addCriterion("ord_id <=", value, "ordId");
            return (Criteria) this;
        }

        public Criteria andOrdIdLike(String value) {
            addCriterion("ord_id like", value, "ordId");
            return (Criteria) this;
        }

        public Criteria andOrdIdNotLike(String value) {
            addCriterion("ord_id not like", value, "ordId");
            return (Criteria) this;
        }

        public Criteria andOrdIdIn(List<String> values) {
            addCriterion("ord_id in", values, "ordId");
            return (Criteria) this;
        }

        public Criteria andOrdIdNotIn(List<String> values) {
            addCriterion("ord_id not in", values, "ordId");
            return (Criteria) this;
        }

        public Criteria andOrdIdBetween(String value1, String value2) {
            addCriterion("ord_id between", value1, value2, "ordId");
            return (Criteria) this;
        }

        public Criteria andOrdIdNotBetween(String value1, String value2) {
            addCriterion("ord_id not between", value1, value2, "ordId");
            return (Criteria) this;
        }

        public Criteria andDateIsNull() {
            addCriterion("date is null");
            return (Criteria) this;
        }

        public Criteria andDateIsNotNull() {
            addCriterion("date is not null");
            return (Criteria) this;
        }

        public Criteria andDateEqualTo(String value) {
            addCriterion("date =", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotEqualTo(String value) {
            addCriterion("date <>", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateGreaterThan(String value) {
            addCriterion("date >", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateGreaterThanOrEqualTo(String value) {
            addCriterion("date >=", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateLessThan(String value) {
            addCriterion("date <", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateLessThanOrEqualTo(String value) {
            addCriterion("date <=", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateLike(String value) {
            addCriterion("date like", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotLike(String value) {
            addCriterion("date not like", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateIn(List<String> values) {
            addCriterion("date in", values, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotIn(List<String> values) {
            addCriterion("date not in", values, "date");
            return (Criteria) this;
        }

        public Criteria andDateBetween(String value1, String value2) {
            addCriterion("date between", value1, value2, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotBetween(String value1, String value2) {
            addCriterion("date not between", value1, value2, "date");
            return (Criteria) this;
        }

        public Criteria andRnameIsNull() {
            addCriterion("Rname is null");
            return (Criteria) this;
        }

        public Criteria andRnameIsNotNull() {
            addCriterion("Rname is not null");
            return (Criteria) this;
        }

        public Criteria andRnameEqualTo(String value) {
            addCriterion("Rname =", value, "rname");
            return (Criteria) this;
        }

        public Criteria andRnameNotEqualTo(String value) {
            addCriterion("Rname <>", value, "rname");
            return (Criteria) this;
        }

        public Criteria andRnameGreaterThan(String value) {
            addCriterion("Rname >", value, "rname");
            return (Criteria) this;
        }

        public Criteria andRnameGreaterThanOrEqualTo(String value) {
            addCriterion("Rname >=", value, "rname");
            return (Criteria) this;
        }

        public Criteria andRnameLessThan(String value) {
            addCriterion("Rname <", value, "rname");
            return (Criteria) this;
        }

        public Criteria andRnameLessThanOrEqualTo(String value) {
            addCriterion("Rname <=", value, "rname");
            return (Criteria) this;
        }

        public Criteria andRnameLike(String value) {
            addCriterion("Rname like", value, "rname");
            return (Criteria) this;
        }

        public Criteria andRnameNotLike(String value) {
            addCriterion("Rname not like", value, "rname");
            return (Criteria) this;
        }

        public Criteria andRnameIn(List<String> values) {
            addCriterion("Rname in", values, "rname");
            return (Criteria) this;
        }

        public Criteria andRnameNotIn(List<String> values) {
            addCriterion("Rname not in", values, "rname");
            return (Criteria) this;
        }

        public Criteria andRnameBetween(String value1, String value2) {
            addCriterion("Rname between", value1, value2, "rname");
            return (Criteria) this;
        }

        public Criteria andRnameNotBetween(String value1, String value2) {
            addCriterion("Rname not between", value1, value2, "rname");
            return (Criteria) this;
        }

        public Criteria andRphoneIsNull() {
            addCriterion("Rphone is null");
            return (Criteria) this;
        }

        public Criteria andRphoneIsNotNull() {
            addCriterion("Rphone is not null");
            return (Criteria) this;
        }

        public Criteria andRphoneEqualTo(String value) {
            addCriterion("Rphone =", value, "rphone");
            return (Criteria) this;
        }

        public Criteria andRphoneNotEqualTo(String value) {
            addCriterion("Rphone <>", value, "rphone");
            return (Criteria) this;
        }

        public Criteria andRphoneGreaterThan(String value) {
            addCriterion("Rphone >", value, "rphone");
            return (Criteria) this;
        }

        public Criteria andRphoneGreaterThanOrEqualTo(String value) {
            addCriterion("Rphone >=", value, "rphone");
            return (Criteria) this;
        }

        public Criteria andRphoneLessThan(String value) {
            addCriterion("Rphone <", value, "rphone");
            return (Criteria) this;
        }

        public Criteria andRphoneLessThanOrEqualTo(String value) {
            addCriterion("Rphone <=", value, "rphone");
            return (Criteria) this;
        }

        public Criteria andRphoneLike(String value) {
            addCriterion("Rphone like", value, "rphone");
            return (Criteria) this;
        }

        public Criteria andRphoneNotLike(String value) {
            addCriterion("Rphone not like", value, "rphone");
            return (Criteria) this;
        }

        public Criteria andRphoneIn(List<String> values) {
            addCriterion("Rphone in", values, "rphone");
            return (Criteria) this;
        }

        public Criteria andRphoneNotIn(List<String> values) {
            addCriterion("Rphone not in", values, "rphone");
            return (Criteria) this;
        }

        public Criteria andRphoneBetween(String value1, String value2) {
            addCriterion("Rphone between", value1, value2, "rphone");
            return (Criteria) this;
        }

        public Criteria andRphoneNotBetween(String value1, String value2) {
            addCriterion("Rphone not between", value1, value2, "rphone");
            return (Criteria) this;
        }

        public Criteria andRaddressIsNull() {
            addCriterion("Raddress is null");
            return (Criteria) this;
        }

        public Criteria andRaddressIsNotNull() {
            addCriterion("Raddress is not null");
            return (Criteria) this;
        }

        public Criteria andRaddressEqualTo(String value) {
            addCriterion("Raddress =", value, "raddress");
            return (Criteria) this;
        }

        public Criteria andRaddressNotEqualTo(String value) {
            addCriterion("Raddress <>", value, "raddress");
            return (Criteria) this;
        }

        public Criteria andRaddressGreaterThan(String value) {
            addCriterion("Raddress >", value, "raddress");
            return (Criteria) this;
        }

        public Criteria andRaddressGreaterThanOrEqualTo(String value) {
            addCriterion("Raddress >=", value, "raddress");
            return (Criteria) this;
        }

        public Criteria andRaddressLessThan(String value) {
            addCriterion("Raddress <", value, "raddress");
            return (Criteria) this;
        }

        public Criteria andRaddressLessThanOrEqualTo(String value) {
            addCriterion("Raddress <=", value, "raddress");
            return (Criteria) this;
        }

        public Criteria andRaddressLike(String value) {
            addCriterion("Raddress like", value, "raddress");
            return (Criteria) this;
        }

        public Criteria andRaddressNotLike(String value) {
            addCriterion("Raddress not like", value, "raddress");
            return (Criteria) this;
        }

        public Criteria andRaddressIn(List<String> values) {
            addCriterion("Raddress in", values, "raddress");
            return (Criteria) this;
        }

        public Criteria andRaddressNotIn(List<String> values) {
            addCriterion("Raddress not in", values, "raddress");
            return (Criteria) this;
        }

        public Criteria andRaddressBetween(String value1, String value2) {
            addCriterion("Raddress between", value1, value2, "raddress");
            return (Criteria) this;
        }

        public Criteria andRaddressNotBetween(String value1, String value2) {
            addCriterion("Raddress not between", value1, value2, "raddress");
            return (Criteria) this;
        }

        public Criteria andSnameIsNull() {
            addCriterion("Sname is null");
            return (Criteria) this;
        }

        public Criteria andSnameIsNotNull() {
            addCriterion("Sname is not null");
            return (Criteria) this;
        }

        public Criteria andSnameEqualTo(String value) {
            addCriterion("Sname =", value, "sname");
            return (Criteria) this;
        }

        public Criteria andSnameNotEqualTo(String value) {
            addCriterion("Sname <>", value, "sname");
            return (Criteria) this;
        }

        public Criteria andSnameGreaterThan(String value) {
            addCriterion("Sname >", value, "sname");
            return (Criteria) this;
        }

        public Criteria andSnameGreaterThanOrEqualTo(String value) {
            addCriterion("Sname >=", value, "sname");
            return (Criteria) this;
        }

        public Criteria andSnameLessThan(String value) {
            addCriterion("Sname <", value, "sname");
            return (Criteria) this;
        }

        public Criteria andSnameLessThanOrEqualTo(String value) {
            addCriterion("Sname <=", value, "sname");
            return (Criteria) this;
        }

        public Criteria andSnameLike(String value) {
            addCriterion("Sname like", value, "sname");
            return (Criteria) this;
        }

        public Criteria andSnameNotLike(String value) {
            addCriterion("Sname not like", value, "sname");
            return (Criteria) this;
        }

        public Criteria andSnameIn(List<String> values) {
            addCriterion("Sname in", values, "sname");
            return (Criteria) this;
        }

        public Criteria andSnameNotIn(List<String> values) {
            addCriterion("Sname not in", values, "sname");
            return (Criteria) this;
        }

        public Criteria andSnameBetween(String value1, String value2) {
            addCriterion("Sname between", value1, value2, "sname");
            return (Criteria) this;
        }

        public Criteria andSnameNotBetween(String value1, String value2) {
            addCriterion("Sname not between", value1, value2, "sname");
            return (Criteria) this;
        }

        public Criteria andSphoneIsNull() {
            addCriterion("Sphone is null");
            return (Criteria) this;
        }

        public Criteria andSphoneIsNotNull() {
            addCriterion("Sphone is not null");
            return (Criteria) this;
        }

        public Criteria andSphoneEqualTo(String value) {
            addCriterion("Sphone =", value, "sphone");
            return (Criteria) this;
        }

        public Criteria andSphoneNotEqualTo(String value) {
            addCriterion("Sphone <>", value, "sphone");
            return (Criteria) this;
        }

        public Criteria andSphoneGreaterThan(String value) {
            addCriterion("Sphone >", value, "sphone");
            return (Criteria) this;
        }

        public Criteria andSphoneGreaterThanOrEqualTo(String value) {
            addCriterion("Sphone >=", value, "sphone");
            return (Criteria) this;
        }

        public Criteria andSphoneLessThan(String value) {
            addCriterion("Sphone <", value, "sphone");
            return (Criteria) this;
        }

        public Criteria andSphoneLessThanOrEqualTo(String value) {
            addCriterion("Sphone <=", value, "sphone");
            return (Criteria) this;
        }

        public Criteria andSphoneLike(String value) {
            addCriterion("Sphone like", value, "sphone");
            return (Criteria) this;
        }

        public Criteria andSphoneNotLike(String value) {
            addCriterion("Sphone not like", value, "sphone");
            return (Criteria) this;
        }

        public Criteria andSphoneIn(List<String> values) {
            addCriterion("Sphone in", values, "sphone");
            return (Criteria) this;
        }

        public Criteria andSphoneNotIn(List<String> values) {
            addCriterion("Sphone not in", values, "sphone");
            return (Criteria) this;
        }

        public Criteria andSphoneBetween(String value1, String value2) {
            addCriterion("Sphone between", value1, value2, "sphone");
            return (Criteria) this;
        }

        public Criteria andSphoneNotBetween(String value1, String value2) {
            addCriterion("Sphone not between", value1, value2, "sphone");
            return (Criteria) this;
        }

        public Criteria andSaddressIsNull() {
            addCriterion("Saddress is null");
            return (Criteria) this;
        }

        public Criteria andSaddressIsNotNull() {
            addCriterion("Saddress is not null");
            return (Criteria) this;
        }

        public Criteria andSaddressEqualTo(String value) {
            addCriterion("Saddress =", value, "saddress");
            return (Criteria) this;
        }

        public Criteria andSaddressNotEqualTo(String value) {
            addCriterion("Saddress <>", value, "saddress");
            return (Criteria) this;
        }

        public Criteria andSaddressGreaterThan(String value) {
            addCriterion("Saddress >", value, "saddress");
            return (Criteria) this;
        }

        public Criteria andSaddressGreaterThanOrEqualTo(String value) {
            addCriterion("Saddress >=", value, "saddress");
            return (Criteria) this;
        }

        public Criteria andSaddressLessThan(String value) {
            addCriterion("Saddress <", value, "saddress");
            return (Criteria) this;
        }

        public Criteria andSaddressLessThanOrEqualTo(String value) {
            addCriterion("Saddress <=", value, "saddress");
            return (Criteria) this;
        }

        public Criteria andSaddressLike(String value) {
            addCriterion("Saddress like", value, "saddress");
            return (Criteria) this;
        }

        public Criteria andSaddressNotLike(String value) {
            addCriterion("Saddress not like", value, "saddress");
            return (Criteria) this;
        }

        public Criteria andSaddressIn(List<String> values) {
            addCriterion("Saddress in", values, "saddress");
            return (Criteria) this;
        }

        public Criteria andSaddressNotIn(List<String> values) {
            addCriterion("Saddress not in", values, "saddress");
            return (Criteria) this;
        }

        public Criteria andSaddressBetween(String value1, String value2) {
            addCriterion("Saddress between", value1, value2, "saddress");
            return (Criteria) this;
        }

        public Criteria andSaddressNotBetween(String value1, String value2) {
            addCriterion("Saddress not between", value1, value2, "saddress");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}