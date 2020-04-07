package com.chen.lms.bean;

import java.util.ArrayList;
import java.util.List;

public class CarExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public CarExample() {
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

        public Criteria andCarIdIsNull() {
            addCriterion("car_id is null");
            return (Criteria) this;
        }

        public Criteria andCarIdIsNotNull() {
            addCriterion("car_id is not null");
            return (Criteria) this;
        }

        public Criteria andCarIdEqualTo(Integer value) {
            addCriterion("car_id =", value, "carId");
            return (Criteria) this;
        }

        public Criteria andCarIdNotEqualTo(Integer value) {
            addCriterion("car_id <>", value, "carId");
            return (Criteria) this;
        }

        public Criteria andCarIdGreaterThan(Integer value) {
            addCriterion("car_id >", value, "carId");
            return (Criteria) this;
        }

        public Criteria andCarIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("car_id >=", value, "carId");
            return (Criteria) this;
        }

        public Criteria andCarIdLessThan(Integer value) {
            addCriterion("car_id <", value, "carId");
            return (Criteria) this;
        }

        public Criteria andCarIdLessThanOrEqualTo(Integer value) {
            addCriterion("car_id <=", value, "carId");
            return (Criteria) this;
        }

        public Criteria andCarIdIn(List<Integer> values) {
            addCriterion("car_id in", values, "carId");
            return (Criteria) this;
        }

        public Criteria andCarIdNotIn(List<Integer> values) {
            addCriterion("car_id not in", values, "carId");
            return (Criteria) this;
        }

        public Criteria andCarIdBetween(Integer value1, Integer value2) {
            addCriterion("car_id between", value1, value2, "carId");
            return (Criteria) this;
        }

        public Criteria andCarIdNotBetween(Integer value1, Integer value2) {
            addCriterion("car_id not between", value1, value2, "carId");
            return (Criteria) this;
        }

        public Criteria andRoadIdIsNull() {
            addCriterion("road_id is null");
            return (Criteria) this;
        }

        public Criteria andRoadIdIsNotNull() {
            addCriterion("road_id is not null");
            return (Criteria) this;
        }

        public Criteria andRoadIdEqualTo(Integer value) {
            addCriterion("road_id =", value, "roadId");
            return (Criteria) this;
        }

        public Criteria andRoadIdNotEqualTo(Integer value) {
            addCriterion("road_id <>", value, "roadId");
            return (Criteria) this;
        }

        public Criteria andRoadIdGreaterThan(Integer value) {
            addCriterion("road_id >", value, "roadId");
            return (Criteria) this;
        }

        public Criteria andRoadIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("road_id >=", value, "roadId");
            return (Criteria) this;
        }

        public Criteria andRoadIdLessThan(Integer value) {
            addCriterion("road_id <", value, "roadId");
            return (Criteria) this;
        }

        public Criteria andRoadIdLessThanOrEqualTo(Integer value) {
            addCriterion("road_id <=", value, "roadId");
            return (Criteria) this;
        }

        public Criteria andRoadIdIn(List<Integer> values) {
            addCriterion("road_id in", values, "roadId");
            return (Criteria) this;
        }

        public Criteria andRoadIdNotIn(List<Integer> values) {
            addCriterion("road_id not in", values, "roadId");
            return (Criteria) this;
        }

        public Criteria andRoadIdBetween(Integer value1, Integer value2) {
            addCriterion("road_id between", value1, value2, "roadId");
            return (Criteria) this;
        }

        public Criteria andRoadIdNotBetween(Integer value1, Integer value2) {
            addCriterion("road_id not between", value1, value2, "roadId");
            return (Criteria) this;
        }

        public Criteria andEmIdIsNull() {
            addCriterion("em_id is null");
            return (Criteria) this;
        }

        public Criteria andEmIdIsNotNull() {
            addCriterion("em_id is not null");
            return (Criteria) this;
        }

        public Criteria andEmIdEqualTo(String value) {
            addCriterion("em_id =", value, "emId");
            return (Criteria) this;
        }

        public Criteria andEmIdNotEqualTo(String value) {
            addCriterion("em_id <>", value, "emId");
            return (Criteria) this;
        }

        public Criteria andEmIdGreaterThan(String value) {
            addCriterion("em_id >", value, "emId");
            return (Criteria) this;
        }

        public Criteria andEmIdGreaterThanOrEqualTo(String value) {
            addCriterion("em_id >=", value, "emId");
            return (Criteria) this;
        }

        public Criteria andEmIdLessThan(String value) {
            addCriterion("em_id <", value, "emId");
            return (Criteria) this;
        }

        public Criteria andEmIdLessThanOrEqualTo(String value) {
            addCriterion("em_id <=", value, "emId");
            return (Criteria) this;
        }

        public Criteria andEmIdLike(String value) {
            addCriterion("em_id like", value, "emId");
            return (Criteria) this;
        }

        public Criteria andEmIdNotLike(String value) {
            addCriterion("em_id not like", value, "emId");
            return (Criteria) this;
        }

        public Criteria andEmIdIn(List<String> values) {
            addCriterion("em_id in", values, "emId");
            return (Criteria) this;
        }

        public Criteria andEmIdNotIn(List<String> values) {
            addCriterion("em_id not in", values, "emId");
            return (Criteria) this;
        }

        public Criteria andEmIdBetween(String value1, String value2) {
            addCriterion("em_id between", value1, value2, "emId");
            return (Criteria) this;
        }

        public Criteria andEmIdNotBetween(String value1, String value2) {
            addCriterion("em_id not between", value1, value2, "emId");
            return (Criteria) this;
        }

        public Criteria andCarTypeIsNull() {
            addCriterion("car_type is null");
            return (Criteria) this;
        }

        public Criteria andCarTypeIsNotNull() {
            addCriterion("car_type is not null");
            return (Criteria) this;
        }

        public Criteria andCarTypeEqualTo(Integer value) {
            addCriterion("car_type =", value, "carType");
            return (Criteria) this;
        }

        public Criteria andCarTypeNotEqualTo(Integer value) {
            addCriterion("car_type <>", value, "carType");
            return (Criteria) this;
        }

        public Criteria andCarTypeGreaterThan(Integer value) {
            addCriterion("car_type >", value, "carType");
            return (Criteria) this;
        }

        public Criteria andCarTypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("car_type >=", value, "carType");
            return (Criteria) this;
        }

        public Criteria andCarTypeLessThan(Integer value) {
            addCriterion("car_type <", value, "carType");
            return (Criteria) this;
        }

        public Criteria andCarTypeLessThanOrEqualTo(Integer value) {
            addCriterion("car_type <=", value, "carType");
            return (Criteria) this;
        }

        public Criteria andCarTypeIn(List<Integer> values) {
            addCriterion("car_type in", values, "carType");
            return (Criteria) this;
        }

        public Criteria andCarTypeNotIn(List<Integer> values) {
            addCriterion("car_type not in", values, "carType");
            return (Criteria) this;
        }

        public Criteria andCarTypeBetween(Integer value1, Integer value2) {
            addCriterion("car_type between", value1, value2, "carType");
            return (Criteria) this;
        }

        public Criteria andCarTypeNotBetween(Integer value1, Integer value2) {
            addCriterion("car_type not between", value1, value2, "carType");
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